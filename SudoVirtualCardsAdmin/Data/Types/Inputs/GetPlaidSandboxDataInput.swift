//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// Input object containing the information required to get Sandbox data from Plaid.
public struct GetPlaidSandboxDataInput {
    /// Id of the financial institution for the Plaid request.
    public let institutionId: String

    /// Plaid username to which the sandbox data belongs.
    public let username: String

    /// Construct `GetPlaidSandboxDataInput` instance.
    /// 
    /// - Parameters:
    ///   - institutionId: Id of the financial institution for the Plaid request.
    ///   - username: Plaid username to which the sandbox data belongs.
    public init(institutionId: String, username: String) {
        self.institutionId = institutionId
        self.username = username
    }
}
