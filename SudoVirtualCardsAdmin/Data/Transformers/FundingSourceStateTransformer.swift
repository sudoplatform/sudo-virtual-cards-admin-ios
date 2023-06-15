//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// Construct a `FundingSourceState` instance from the GraphQL type,
/// with `FundingSourceStateTransformerTransformer.toEntity()`.
enum FundingSourceStateTransformer {
    static func toEntity(
        _ fundingSourceState: GraphQL.FundingSourceState
    ) -> FundingSourceState {
        switch fundingSourceState {
        case .active:
            return FundingSourceState.active
        case .inactive:
            return FundingSourceState.inactive
        case .refresh:
            return FundingSourceState.refresh
        case let .unknown(fundingSourceState):
            return FundingSourceState.unknown(fundingSourceState)
        }
    }
}
