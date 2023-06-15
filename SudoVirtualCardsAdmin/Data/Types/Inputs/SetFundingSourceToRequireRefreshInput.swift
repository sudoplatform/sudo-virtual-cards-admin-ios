//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// Input object containing the information required configure a funding source to require refresh.
public struct SetFundingSourceToRequireRefreshInput {
    /// Id of the funding source that is being configured.
    public let fundingSourceId: String

    /// Construct `SetFundingSourceToRequireRefreshInput` instance.
    /// 
    /// - Parameters:
    ///   - fundingSourceId: Id of the funding source that is being configured.
    public init(fundingSourceId: String) {
        self.fundingSourceId = fundingSourceId
    }
}
