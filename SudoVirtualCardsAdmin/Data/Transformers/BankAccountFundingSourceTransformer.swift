//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

typealias GraphQLSignedAuthorizationText = GraphQL.BankAccountFundingSource.Authorization

/// Construct a `BankAccountFundingSource` instance from the GraphQL type,
/// with `BankAccountFundingSourceTransformer.toEntity()`.
public enum BankAccountFundingSourceTransformer {
    static func toEntity(
        _ fundingSource: GraphQL.BankAccountFundingSource
    ) -> BankAccountFundingSource {
        let bankAccountFundingSource = BankAccountFundingSource(
            id: fundingSource.id,
            owner: fundingSource.owner,
            version: fundingSource.version,
            createdAt: Date(timeIntervalSince1970: fundingSource.createdAtEpochMs),
            updatedAt: Date(timeIntervalSince1970: fundingSource.updatedAtEpochMs),
            state: FundingSourceStateTransformer.toEntity(fundingSource.state),
            currency: fundingSource.currency,
            fingerprint: fundingSource.fingerprint,
            last4: fundingSource.last4,
            bankAccountType: self.toEntityBankAccountType(fundingSource.bankAccountType),
            authorization: self.toEntitySignedAuthorizationText(fundingSource.authorization)
        )

        return bankAccountFundingSource
    }

    private static func toEntityBankAccountType(
        _ bankAccountType: GraphQL.BankAccountType
    ) -> BankAccountType {
        switch bankAccountType {
        case .savings:
            return BankAccountType.savings
        case .checking:
            return BankAccountType.checking
        case .other:
            return BankAccountType.other
        case let .unknown(bankAccountType):
            return BankAccountType.unknown(bankAccountType)
        }
    }

    private static func toEntitySignedAuthorizationText(
        _ signedAuthorizationText: GraphQLSignedAuthorizationText
    ) -> SignedAuthorizationText {
        let authorization = SignedAuthorizationText(
            language: signedAuthorizationText.language,
            content: signedAuthorizationText.content,
            contentType: signedAuthorizationText.contentType,
            data: signedAuthorizationText.data,
            signature: signedAuthorizationText.signature,
            algorithm: signedAuthorizationText.algorithm,
            keyId: signedAuthorizationText.keyId
        )

        return authorization
    }
}
