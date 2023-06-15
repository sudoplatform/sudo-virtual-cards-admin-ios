//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// Definition of a user's Plaid account metadata.
public struct PlaidAccountMetadata: Equatable {
    /// Plaid identifier of the user's bank account.
    public let accountId: String

    /// Bank account subtype, e.g. checking, savings etc.
    public let subtype: String?
}

/// Representation of Plaid Sandbox account data.
public struct PlaidSandboxData: Equatable {
    /// Public token used to complete funding source creation.
    public let publicToken: String

    /// Array of Plaid account metadata items.
    public let accountMetadata: [PlaidAccountMetadata]
}
