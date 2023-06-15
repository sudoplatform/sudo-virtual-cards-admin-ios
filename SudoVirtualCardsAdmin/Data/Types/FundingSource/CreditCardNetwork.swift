//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

///  Representation of an enumeration depicting the card network of a `CreditCardFundingSource` in the Sudo
///  Platform Virtual Cards SDK.
public enum CreditCardNetwork: Equatable {
    case amex
    case diners
    case discover
    case jcb
    case mastercard
    case unionpay
    case visa
    case other

    /// Backwards compatibility guard for catching new enum values added by the service - check you have the latest version of the SDK.
    case unknown(String)
}
