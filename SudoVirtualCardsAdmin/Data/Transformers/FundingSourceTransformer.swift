//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// Construct a `FundingSource` instance from the GraphQL type,
/// with `FundingSourceTransformer.toEntity()`.
public enum FundingSourceTransformer {
    static func toEntity(_ fundingSource: GraphQL.BankAccountFundingSource) -> FundingSource {
        let bankAccountFundingSource = BankAccountFundingSourceTransformer.toEntity(fundingSource)
        return FundingSource.bankAccountFundingSource(bankAccountFundingSource)
    }

    static func toEntity(_ fundingSource: GraphQL.CreditCardFundingSource) -> FundingSource {
        let creditCardFundingSource = CreditCardFundingSourceTransformer.toEntity(fundingSource)
        return FundingSource.creditCardFundingSource(creditCardFundingSource)
    }
}
