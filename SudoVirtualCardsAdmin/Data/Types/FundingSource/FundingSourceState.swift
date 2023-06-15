//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// State type associated with `FundingSource`.
public enum FundingSourceState: Equatable {
    /// Funding source is active.
    case active

    /// Funding source is inactive.
    case inactive

    /// Funding source requires refreshing and revalidation with funding source provider.
    case refresh

    /// Backwards compatibility guard for catching new enum values added by the service
    /// (check you have the latest version of the SDK).
    case unknown(String)
}
