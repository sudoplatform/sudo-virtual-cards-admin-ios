//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import AWSAppSync
import AWSCore
import SudoConfigManager
import SudoLogging

/// Default implementation of `SudoVirtualCardsAdminClient`.
public class DefaultSudoVirtualCardsAdminClient: SudoVirtualCardsAdminClient {
    public struct Config {
        // Configuration namespace.
        struct Namespace {
            static let adminConsoleProjectService = "adminConsoleProjectService"
        }
    }
    /// Default logger for the client.
    private let logger: Logger
    /// GraphQL client for communicating with the Virtual Cards Admin API.
    private let graphQLClient: AWSAppSyncClient

    /// Initializes a new `DefaultSudoVirtualCardsAdminClient` instance.
    ///
    /// - Parameters:
    ///   - apiKey: API key used to authenticate to the Admin Service.
    ///   - logger: A logger to use for logging messages. If none provided then a default internal logger will be used.
    /// - Throws: `SudoVirtualCardsAdminClientError`
    convenience public init(
        apiKey: String,
        logger: Logger? = nil
    ) throws {
        guard let configManager = DefaultSudoConfigManager() else {
            throw SudoVirtualCardsAdminClientError.invalidConfig
        }

        guard let config = configManager.getConfigSet(
            namespace: Config.Namespace.adminConsoleProjectService
        ) else {
            throw SudoVirtualCardsAdminClientError.adminServiceConfigNotFound
        }

        try self.init(config: config, apiKey: apiKey, logger: logger)
    }

    /// Initializes a new `DefaultSudoVirtualCardsAdminClient` instance with the specified backend configuration.
    ///
    /// - Parameters:
    ///   - config: Configuration parameters for the client.
    ///   - apiKey: API key used to authenticate to the Admin Service.
    ///   - logger: A logger to use for logging messages. If none provided then a default internal logger will be used.
    ///   - graphQLClient: Optional GraphQL client to use. Mainly used for unit testing.
    /// - Throws: `SudoVirtualCardsAdminClientError`
    public init(
        config: [String: Any],
        apiKey: String,
        logger: Logger? = nil,
        graphQLClient: AWSAppSyncClient? = nil
    ) throws {
        #if DEBUG
        AWSDDLog.sharedInstance.logLevel = .verbose
        AWSDDLog.add(AWSDDTTYLogger.sharedInstance)
        #endif

        let logger = logger ?? Logger.SudoVirtualCardsAdminClientLogger
        self.logger = logger

        if let graphQLClient = graphQLClient {
            self.graphQLClient = graphQLClient
        } else {
            guard let configProvider = SudoVirtualCardsAdminClientConfig(config: config, apiKey: apiKey) else {
                throw SudoVirtualCardsAdminClientError.invalidConfig
            }
            let appSyncConfig = try AWSAppSyncClientConfiguration(
                appSyncServiceConfig: configProvider,
                userPoolsAuthProvider: nil,
                urlSessionConfiguration: URLSessionConfiguration.ephemeral,
                cacheConfiguration: AWSAppSyncCacheConfiguration.inMemory,
                connectionStateChangeHandler: nil,
                s3ObjectManager: nil,
                presignedURLClient: nil,
                retryStrategy: .aggressive
            )
            self.graphQLClient = try AWSAppSyncClient(appSyncConfig: appSyncConfig)
            self.graphQLClient.apolloClient?.cacheKeyForObject = { $0["id"] }
        }
    }

    /// Get the Plaid sandbox public token and bank account identifier required to provide
    /// information to build the bank account funding source completion data.
    ///
    /// - Parameters:
    ///   - input: Object containing the ID of the bank account institution and Plaid username.
    /// - Returns: Plaid sandbox data linked to the given user details.
    /// - Throws: `SudoVirtualCardsAdminClientError`
    public func getPlaidSandboxData(
        _ input: GetPlaidSandboxDataInput
    ) async throws -> PlaidSandboxData? {
        let operation = GraphQL.GetPlaidSandboxDataQuery(input: GraphQL.GetPlaidSandboxDataRequest(
            institutionId: input.institutionId,
            username: input.username
        ))

        return try await withCheckedThrowingContinuation({ (continuation: CheckedContinuation<PlaidSandboxData?, Error>) in
            self.graphQLClient.fetch(
                query: operation,
                cachePolicy: .fetchIgnoringCacheData,
                resultHandler: { (result, error) in
                    if let error = error {
                        return continuation.resume(throwing: SudoVirtualCardsAdminClientError.fromAppSyncClientError(error: error))
                    }

                    guard let result = result else {
                        return continuation.resume(
                            throwing: SudoVirtualCardsAdminClientError.fatalError(
                                description: "Query completed successfully but result is missing."
                            )
                        )
                    }

                    if let error = result.errors?.first {
                        return continuation.resume(throwing: SudoVirtualCardsAdminClientError.fromGraphQLError(error: error))
                    }

                    guard let item = result.data?.getPlaidSandboxData else {
                        return continuation.resume(returning: nil)
                    }

                    continuation.resume(
                        returning: PlaidSandboxData(
                            publicToken: item.publicToken,
                            accountMetadata: item.accountMetadata.map {
                                PlaidAccountMetadata(
                                    accountId: $0.accountId,
                                    subtype: $0.subtype
                                )
                            }
                        )
                    )
                }
            )
        })
    }

    /// Configure a funding source to require refresh.
    /// 
    /// - Parameters:
    ///   - input: Object containing the ID of the funding source to be configured.
    /// - Returns: The configured funding source.
    /// - Throws: `SudoVirtualCardsAdminClientError`
    public func setFundingSourceToRequireRefresh(
        _ input: SetFundingSourceToRequireRefreshInput
    ) async throws -> FundingSource {
        let operation = GraphQL.SetFundingSourceToRequireRefreshMutation(
            input: GraphQL.SetFundingSourceToRequireRefreshRequest(
                fundingSourceId: input.fundingSourceId
            )
        )

        return try await withCheckedThrowingContinuation({(continuation: CheckedContinuation<FundingSource, Error>)
            in self.graphQLClient.perform(
                mutation: operation,
                resultHandler: { (result, error) in
                    if let error = error {
                        return continuation.resume(throwing: SudoVirtualCardsAdminClientError.fromAppSyncClientError(error: error))
                    }

                    guard let result = result else {
                        return continuation.resume(
                            throwing: SudoVirtualCardsAdminClientError.fatalError(
                                description: "Mutation completed successfully but result is missing."
                            )
                        )
                    }

                    if let error = result.errors?.first {
                        return continuation.resume(throwing: SudoVirtualCardsAdminClientError.fromGraphQLError(error: error))
                    }

                    guard let item = result.data?.setFundingSourceToRequireRefresh else {
                        return continuation.resume(
                            throwing: SudoVirtualCardsAdminClientError.fatalError(
                                description: "Mutation completed successfully but data is missing."
                            )
                        )
                    }

                    if item.__typename == BankAccountFundingSource.Constants.TypeName {
                        guard let bankAccountFundingSource = item.asBankAccountFundingSource else {
                            self.logger.error("No bank account data received in graphql response")
                            return continuation.resume(
                                throwing: SudoVirtualCardsAdminClientError.internalError(
                                    "No bank account data received in graphql response"
                                )
                            )
                        }

                        return continuation.resume(returning: FundingSourceTransformer.toEntity(
                            bankAccountFundingSource.fragments.bankAccountFundingSource
                        ))
                    } else if item.__typename == CreditCardFundingSource.Constants.TypeName {
                        guard let creditCardFundingSource = item.asCreditCardFundingSource else {
                            self.logger.error("No credit card data received in graphql response")
                            return continuation.resume(
                                throwing: SudoVirtualCardsAdminClientError.internalError(
                                    "No credit card data received in graphql response"
                                )
                            )
                        }

                        return continuation.resume(returning: FundingSourceTransformer.toEntity(
                            creditCardFundingSource.fragments.creditCardFundingSource
                        ))
                    }
                }
            )
        })
    }
}
