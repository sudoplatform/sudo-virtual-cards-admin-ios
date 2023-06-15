//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// Construct a `CreditCardFundingSource` instance from the GraphQL type,
/// with `CreditCardFundingSourceTransformer.toEntity()`.
public enum CreditCardFundingSourceTransformer {
    static func toEntity(
        _ fundingSource: GraphQL.CreditCardFundingSource
    ) -> CreditCardFundingSource {
        let creditCardFundingSource = CreditCardFundingSource(
            id: fundingSource.id,
            owner: fundingSource.owner,
            version: fundingSource.version,
            createdAt: Date(timeIntervalSince1970: fundingSource.createdAtEpochMs),
            updatedAt: Date(timeIntervalSince1970: fundingSource.updatedAtEpochMs),
            state: FundingSourceStateTransformer.toEntity(fundingSource.state),
            currency: fundingSource.currency,
            fingerprint: fundingSource.fingerprint,
            last4: fundingSource.last4,
            network: self.toEntityCreditCardNetwork(fundingSource.network),
            cardType: self.toEntityCardType(fundingSource.cardType)
        )

        return creditCardFundingSource
    }

    private static func toEntityCreditCardNetwork(
        _ creditCardNetwork: GraphQL.CreditCardNetwork
    ) -> CreditCardNetwork {
        switch creditCardNetwork {
        case .amex:
            return CreditCardNetwork.amex
        case .diners:
            return CreditCardNetwork.diners
        case .discover:
            return CreditCardNetwork.discover
        case .jcb:
            return CreditCardNetwork.jcb
        case .mastercard:
            return CreditCardNetwork.mastercard
        case .unionpay:
            return CreditCardNetwork.unionpay
        case .visa:
            return CreditCardNetwork.visa
        case .other:
            return CreditCardNetwork.other
        case let .unknown(creditCardNetwork):
            return CreditCardNetwork.unknown(creditCardNetwork)
        }
    }

    private static func toEntityCardType(
        _ cardType: GraphQL.CardType
    ) -> CardType {
        switch cardType {
        case .credit:
            return CardType.credit
        case .debit:
            return CardType.debit
        case .prepaid:
            return CardType.prepaid
        case .other:
            return CardType.other
        case let .unknown(cardType):
            return CardType.unknown(cardType)
        }
    }
}
