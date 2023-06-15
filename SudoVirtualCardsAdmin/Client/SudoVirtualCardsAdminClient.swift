//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Protocol encapsulating a set of functions for Virtual Cards Admin API.
public protocol SudoVirtualCardsAdminClient: AnyObject {
    /// Get the Plaid sandbox public token and bank account identifier required to provide
    /// information to build the bank account funding source completion data.
    ///
    /// - Parameters:
    ///   - input: Object containing the ID of the bank account institution and Plaid username.
    /// - Returns: Plaid sandbox data linked to the given user details.
    func getPlaidSandboxData(
        _ input: GetPlaidSandboxDataInput
    ) async throws -> PlaidSandboxData?

    /// Configure a funding source to require refresh.
    ///
    /// - Parameters:
    ///   - input: Object containing the ID of the funding source to be configured.
    /// - Returns: The configured funding source.
    func setFundingSourceToRequireRefresh(
        _ input: SetFundingSourceToRequireRefreshInput
    ) async throws -> FundingSource
}
