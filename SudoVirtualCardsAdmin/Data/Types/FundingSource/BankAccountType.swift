//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// Describes the type of bank account attached to a funding source.
public enum BankAccountType: Equatable {
    /// Savings bank account.
    case savings

    /// Checking bank account.
    case checking

    /// Unspecified type of bank account.
    case other

    /// Backwards compatibility guard for catching new enum values added by the service
    /// - (check you have the latest version of the SDK).
    case unknown(String)
}
