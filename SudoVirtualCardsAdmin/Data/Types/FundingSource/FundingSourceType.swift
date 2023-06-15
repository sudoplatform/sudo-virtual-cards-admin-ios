//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// Describes the delivery method of funds on `FundingSource`.
public enum FundingSourceType: Equatable {
    /// Credit or debit card based funding source
    case creditCard

    /// Bank account based funding source
    case bankAccount

    /// Backwards compatibility guard for catching new enum values added by the service
    /// - (check you have the latest version of the SDK).
    case unknown(String)
}
