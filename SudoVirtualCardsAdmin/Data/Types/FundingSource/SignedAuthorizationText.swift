//
// Copyright © 2023 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// Representation of text of an authorization to be presented to and agreed to by the user when
/// adding a bank account funding source. The AuthorizationText presented must be submitted as
/// part of the completion data to complete a bank account funding source, or as part of the refresh
/// data to refresh a bank account funding source.
public struct SignedAuthorizationText: Equatable {
    // MARK: - Properties

    /// RFC5646 language tag in which the text is written.
    public let language: String

    /// The text of the authorization.
    public let content: String

    /// The content type used for determining how to display the content (e.g. text/html, text/plain).
    public let contentType: String

    /// Data that is signed. This is a serialised JSON document of the form:
    /// {
    ///   "hash": "<base64-encoded-hash-of-authorization-agreement-text-agreed-to>",
    ///   "hashAlgorithm": "<algorithm-used-to-hash-the-agreement-text>",
    ///   "signedAt": "<ISO8601-UTC-timestamp-of-time-signature-generated>",
    ///   "account": "<unique-identifier-of-account-agreement-pertains-to>",
    /// }
    public let data: String

    /// Base64 encoded signature of the data.
    public let signature: String

    /// Algorithm used to generate the signature.
    public let algorithm: String

    /// ID of public key registered with the virtual cards service corresponding
    /// to the private key used to generate the signature.
    public let keyId: String

    // MARK: - Lifecycle

    /// Construct an AuthorizationText:
    ///
    /// - Parameters:
    ///   - language: RFC5646 language tag in which the text is written
    ///   - content: The text of the authorization
    ///   - contenType: The content type used for determining how to display the content (e.g. text/html, text/plain).
    ///   - data: Signed data.
    ///   - signature: Base64 encoded signature of the data.
    ///   - algorithm: Algorithm used to generate the signature.
    ///   - keyId: ID of public key registered with the virtual cards service corresponding
    ///            to the private key used to generate the signature.
    public init(
        language: String,
        content: String,
        contentType: String,
        data: String,
        signature: String,
        algorithm: String,
        keyId: String
    ) {
        self.language = language
        self.content = content
        self.contentType = contentType
        self.data = data
        self.signature = signature
        self.algorithm = algorithm
        self.keyId = keyId
    }
}
