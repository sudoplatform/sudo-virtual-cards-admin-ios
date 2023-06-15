//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

///  Representation of an enumeration depicting the card type of a `CreditCardFundingSource`
///  in the Sudo Platform Virtual Cards SDK.
public enum CardType: Equatable {
    /// Credit Card funding source
    case credit

    /// Debit Card funding source
    case debit

    /// Prepaid card funding source
    case prepaid

    /// Other card funding source type
    case other

    /// Backwards compatibility guard for catching new enum values added by the service
    /// - (check you have the latest version of the SDK).
    case unknown(String)
}
