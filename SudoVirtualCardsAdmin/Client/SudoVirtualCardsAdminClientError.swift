//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import AWSAppSync

/// Possible error types returned from `SudoVirtualCardsAdminClient`.
public enum SudoVirtualCardsAdminClientError: Error, Equatable {
    /// Indicates that the configuration dictionary passed to initialize the client was not valid.
    case invalidConfig

    /// Indicates the configuration related to Admin Service is not found. This may indicate that Admin Service
    /// is not deployed into your runtime instance or the config file that you are using is invalid..
    case adminServiceConfigNotFound

    /// Indicates that the input to the API was invalid.
    case invalidInput

    /// Indicates that the request operation failed due to authorization error. This maybe due to the authentication
    /// token being invalid or other security controls that prevent the user from accessing the API.
    case notAuthorized

    /// Indicates that the request failed due to connectivity, availability or access error.
    case requestFailed(response: HTTPURLResponse?, cause: Error?)

    /// Indicates that a GraphQL error was returned by the backend.
    case graphQLError(cause: Error)

    /// AppSyncClient client returned an unexpected error.
    case appSyncClientError(cause: Error)

    /// Indicates that a fatal error occurred. This could be due to coding error, out-of-memory condition or other
    /// conditions that is beyond control of `SudoVirtualCardsAdminClient` implementation.
    case fatalError(description: String)

    /// An internal error has occurred and will need to be resolved by Anonyome.
    case internalError(_ cause: String?)

    /// The request would exceed an API limit
    case limitExceededError

    /// Indicates that an internal server error caused the operation to fail. The error is possibly transient and
    /// retrying at a later time may cause the operation to complete successfully
    case serviceError

    public static func == (lhs: SudoVirtualCardsAdminClientError, rhs: SudoVirtualCardsAdminClientError) -> Bool {
        switch(lhs, rhs) {
        case (.invalidConfig, .invalidConfig): return true
        case (.adminServiceConfigNotFound, .adminServiceConfigNotFound): return true
        case (.invalidInput, .invalidInput): return true
        case (.notAuthorized, .notAuthorized): return true
        case
            (.requestFailed, .requestFailed),
            (.graphQLError, .graphQLError),
            (.appSyncClientError, appSyncClientError),
            (.fatalError, fatalError),
            (.internalError, internalError):
            // We return false for these since we can't compare the error properties of this error. We list these here for completeness.
            return false
        case (.limitExceededError, .limitExceededError):
            return true
        case (.serviceError, .serviceError):
            return true
        default:
            return false
        }
    }

    private struct SudoPlatformServiceError {
        static let type = "errorType"
        static let decodingError = "sudoplatform.DecodingError"
        static let invalidArgumentError = "sudoplatform.InvalidArgumentError"
        static let limitExceededError = "sudoplatform.LimitExceededError"
        static let serviceError = "sudoplatform.ServiceError"
    }

    static func fromAppSyncClientError(error: Error) -> SudoVirtualCardsAdminClientError {
        switch error {
        case AWSAppSyncClientError.authenticationError(_): return .notAuthorized
        case AWSAppSyncClientError.requestFailed(_, let response, let cause):
            if let statusCode = response?.statusCode {
                if statusCode == 401 {
                    return .notAuthorized
                }
            }
            return .requestFailed(response: response, cause: cause)
        default:
            return .appSyncClientError(cause: error)
        }
    }

    static func fromGraphQLError(error: GraphQLError) -> SudoVirtualCardsAdminClientError {
        guard let errorType = error[SudoPlatformServiceError.type] as? String else {
            return .fatalError(
                description: "GraphQL operation failed but error type was not found in the response. \(error)"
            )
        }

        guard let result = fromGraphQLErrorType(errorType) else {
            return .graphQLError(cause: error)
        }
        return result
    }

    static func fromGraphQLErrorType(_ errorType: String) -> SudoVirtualCardsAdminClientError? {
        switch errorType {
        case SudoPlatformServiceError.invalidArgumentError, SudoPlatformServiceError.decodingError: return .invalidInput
        case SudoPlatformServiceError.limitExceededError: return .limitExceededError
        case SudoPlatformServiceError.serviceError: return .serviceError
        default: return nil
        }
    }
}
