// swiftlint:disable all
//  This file was automatically generated and should not be edited.

import AWSAppSync

struct GraphQL {

/// ACTIVE: Funding source is completely set up and in a state suitable
/// for funding virtual card transactions
/// 
/// INACTIVE: Funding source is inactive. Is not usable for funding of new transactions
/// but may receive refunds or additional charges on partially complete transactions.
/// 
/// REFRESH: Funding source requires a provider-specific refresh. Is currently active
/// (and obeys other status associated with ACTIVE) but may be moved to INACTIVE if user
/// intervention does not occur.
internal enum FundingSourceState: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  internal typealias RawValue = String
  case active
  case inactive
  case refresh
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "ACTIVE": self = .active
      case "INACTIVE": self = .inactive
      case "REFRESH": self = .refresh
      default: self = .unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .active: return "ACTIVE"
      case .inactive: return "INACTIVE"
      case .refresh: return "REFRESH"
      case .unknown(let value): return value
    }
  }

  internal static func == (lhs: FundingSourceState, rhs: FundingSourceState) -> Bool {
    switch (lhs, rhs) {
      case (.active, .active): return true
      case (.inactive, .inactive): return true
      case (.refresh, .refresh): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

internal enum CardType: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  internal typealias RawValue = String
  case credit
  case debit
  case other
  case prepaid
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "CREDIT": self = .credit
      case "DEBIT": self = .debit
      case "OTHER": self = .other
      case "PREPAID": self = .prepaid
      default: self = .unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .credit: return "CREDIT"
      case .debit: return "DEBIT"
      case .other: return "OTHER"
      case .prepaid: return "PREPAID"
      case .unknown(let value): return value
    }
  }

  internal static func == (lhs: CardType, rhs: CardType) -> Bool {
    switch (lhs, rhs) {
      case (.credit, .credit): return true
      case (.debit, .debit): return true
      case (.other, .other): return true
      case (.prepaid, .prepaid): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

internal enum CreditCardNetwork: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  internal typealias RawValue = String
  case amex
  case diners
  case discover
  case jcb
  case mastercard
  case other
  case unionpay
  case visa
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "AMEX": self = .amex
      case "DINERS": self = .diners
      case "DISCOVER": self = .discover
      case "JCB": self = .jcb
      case "MASTERCARD": self = .mastercard
      case "OTHER": self = .other
      case "UNIONPAY": self = .unionpay
      case "VISA": self = .visa
      default: self = .unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .amex: return "AMEX"
      case .diners: return "DINERS"
      case .discover: return "DISCOVER"
      case .jcb: return "JCB"
      case .mastercard: return "MASTERCARD"
      case .other: return "OTHER"
      case .unionpay: return "UNIONPAY"
      case .visa: return "VISA"
      case .unknown(let value): return value
    }
  }

  internal static func == (lhs: CreditCardNetwork, rhs: CreditCardNetwork) -> Bool {
    switch (lhs, rhs) {
      case (.amex, .amex): return true
      case (.diners, .diners): return true
      case (.discover, .discover): return true
      case (.jcb, .jcb): return true
      case (.mastercard, .mastercard): return true
      case (.other, .other): return true
      case (.unionpay, .unionpay): return true
      case (.visa, .visa): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

internal enum BankAccountType: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  internal typealias RawValue = String
  case checking
  case other
  case savings
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "CHECKING": self = .checking
      case "OTHER": self = .other
      case "SAVINGS": self = .savings
      default: self = .unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .checking: return "CHECKING"
      case .other: return "OTHER"
      case .savings: return "SAVINGS"
      case .unknown(let value): return value
    }
  }

  internal static func == (lhs: BankAccountType, rhs: BankAccountType) -> Bool {
    switch (lhs, rhs) {
      case (.checking, .checking): return true
      case (.other, .other): return true
      case (.savings, .savings): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

/// Request to manually set a funding source specified by its identifier to a REFRESH
/// state.
internal struct SetFundingSourceToRequireRefreshRequest: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(fundingSourceId: String) {
    graphQLMap = ["fundingSourceId": fundingSourceId]
  }

  internal var fundingSourceId: String {
    get {
      return graphQLMap["fundingSourceId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "fundingSourceId")
    }
  }
}

/// Request to generate and retrieve the internal token and bank account id required
/// to complete bank account funding source provisioning in a sandbox context.
/// 
/// List of supported sandbox institutionId: https://plaid.com/docs/sandbox/institutions/
internal struct GetPlaidSandboxDataRequest: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(institutionId: String, username: String) {
    graphQLMap = ["institutionId": institutionId, "username": username]
  }

  internal var institutionId: String {
    get {
      return graphQLMap["institutionId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "institutionId")
    }
  }

  internal var username: String {
    get {
      return graphQLMap["username"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "username")
    }
  }
}

internal final class SetFundingSourceToRequireRefreshMutation: GraphQLMutation {
  internal static let operationString =
    "mutation SetFundingSourceToRequireRefresh($input: SetFundingSourceToRequireRefreshRequest!) {\n  setFundingSourceToRequireRefresh(input: $input) {\n    __typename\n    ...AdminFundingSource\n  }\n}"

  internal static var requestString: String { return operationString.appending(AdminFundingSource.fragmentString).appending(CreditCardFundingSource.fragmentString).appending(BankAccountFundingSource.fragmentString).appending(SignedAuthorizationText.fragmentString) }

  internal var input: SetFundingSourceToRequireRefreshRequest

  internal init(input: SetFundingSourceToRequireRefreshRequest) {
    self.input = input
  }

  internal var variables: GraphQLMap? {
    return ["input": input]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Mutation"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("setFundingSourceToRequireRefresh", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(SetFundingSourceToRequireRefresh.selections))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(setFundingSourceToRequireRefresh: SetFundingSourceToRequireRefresh) {
      self.init(snapshot: ["__typename": "Mutation", "setFundingSourceToRequireRefresh": setFundingSourceToRequireRefresh.snapshot])
    }

    /// Manually set a funding source specified by its identifier to a REFRESH
    /// state.
    internal var setFundingSourceToRequireRefresh: SetFundingSourceToRequireRefresh {
      get {
        return SetFundingSourceToRequireRefresh(snapshot: snapshot["setFundingSourceToRequireRefresh"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "setFundingSourceToRequireRefresh")
      }
    }

    internal struct SetFundingSourceToRequireRefresh: GraphQLSelectionSet {
      internal static let possibleTypes = ["BankAccountFundingSource", "CreditCardFundingSource"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLTypeCase(
          variants: ["CreditCardFundingSource": AsCreditCardFundingSource.selections, "BankAccountFundingSource": AsBankAccountFundingSource.selections],
          default: [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          ]
        )
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal static func makeCreditCardFundingSource(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, fingerprint: GraphQLID, last4: String, cardType: CardType, network: CreditCardNetwork) -> SetFundingSourceToRequireRefresh {
        return SetFundingSourceToRequireRefresh(snapshot: ["__typename": "CreditCardFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "fingerprint": fingerprint, "last4": last4, "cardType": cardType, "network": network])
      }

      internal static func makeBankAccountFundingSource(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, fingerprint: GraphQLID, last4: String, bankAccountType: BankAccountType, authorization: AsBankAccountFundingSource.Authorization) -> SetFundingSourceToRequireRefresh {
        return SetFundingSourceToRequireRefresh(snapshot: ["__typename": "BankAccountFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "fingerprint": fingerprint, "last4": last4, "bankAccountType": bankAccountType, "authorization": authorization.snapshot])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      internal struct Fragments {
        internal var snapshot: Snapshot

        internal var adminFundingSource: AdminFundingSource {
          get {
            return AdminFundingSource(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      internal var asCreditCardFundingSource: AsCreditCardFundingSource? {
        get {
          if !AsCreditCardFundingSource.possibleTypes.contains(__typename) { return nil }
          return AsCreditCardFundingSource(snapshot: snapshot)
        }
        set {
          guard let newValue = newValue else { return }
          snapshot = newValue.snapshot
        }
      }

      internal struct AsCreditCardFundingSource: GraphQLSelectionSet {
        internal static let possibleTypes = ["CreditCardFundingSource"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("state", type: .nonNull(.scalar(FundingSourceState.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("fingerprint", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("last4", type: .nonNull(.scalar(String.self))),
          GraphQLField("cardType", type: .nonNull(.scalar(CardType.self))),
          GraphQLField("network", type: .nonNull(.scalar(CreditCardNetwork.self))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, fingerprint: GraphQLID, last4: String, cardType: CardType, network: CreditCardNetwork) {
          self.init(snapshot: ["__typename": "CreditCardFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "fingerprint": fingerprint, "last4": last4, "cardType": cardType, "network": network])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// See CommonObject.id
        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        /// See CommonObject.owner
        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        /// See CommonObject.version
        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        /// See CommonObject.createdAtEpochMs
        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        /// See CommonObject.updatedAtEpochMs
        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        /// See CommonFundingSource.state
        internal var state: FundingSourceState {
          get {
            return snapshot["state"]! as! FundingSourceState
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        /// See CommonFundingSource.currency
        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        /// See CommonFundingSource.fingerprint
        internal var fingerprint: GraphQLID {
          get {
            return snapshot["fingerprint"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "fingerprint")
          }
        }

        /// Last 4 digits of user's credit card
        internal var last4: String {
          get {
            return snapshot["last4"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last4")
          }
        }

        /// Type of card
        internal var cardType: CardType {
          get {
            return snapshot["cardType"]! as! CardType
          }
          set {
            snapshot.updateValue(newValue, forKey: "cardType")
          }
        }

        /// Card network of card
        internal var network: CreditCardNetwork {
          get {
            return snapshot["network"]! as! CreditCardNetwork
          }
          set {
            snapshot.updateValue(newValue, forKey: "network")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var adminFundingSource: AdminFundingSource {
            get {
              return AdminFundingSource(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal var creditCardFundingSource: CreditCardFundingSource {
            get {
              return CreditCardFundingSource(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }
      }

      internal var asBankAccountFundingSource: AsBankAccountFundingSource? {
        get {
          if !AsBankAccountFundingSource.possibleTypes.contains(__typename) { return nil }
          return AsBankAccountFundingSource(snapshot: snapshot)
        }
        set {
          guard let newValue = newValue else { return }
          snapshot = newValue.snapshot
        }
      }

      internal struct AsBankAccountFundingSource: GraphQLSelectionSet {
        internal static let possibleTypes = ["BankAccountFundingSource"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("version", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
          GraphQLField("state", type: .nonNull(.scalar(FundingSourceState.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("fingerprint", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("last4", type: .nonNull(.scalar(String.self))),
          GraphQLField("bankAccountType", type: .nonNull(.scalar(BankAccountType.self))),
          GraphQLField("authorization", type: .nonNull(.object(Authorization.selections))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, fingerprint: GraphQLID, last4: String, bankAccountType: BankAccountType, authorization: Authorization) {
          self.init(snapshot: ["__typename": "BankAccountFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "fingerprint": fingerprint, "last4": last4, "bankAccountType": bankAccountType, "authorization": authorization.snapshot])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// See CommonObject.id
        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        /// See CommonObject.owner
        internal var owner: GraphQLID {
          get {
            return snapshot["owner"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }

        /// See CommonObject.version
        internal var version: Int {
          get {
            return snapshot["version"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "version")
          }
        }

        /// See CommonObject.createdAtEpochMs
        internal var createdAtEpochMs: Double {
          get {
            return snapshot["createdAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
          }
        }

        /// See CommonObject.updatedAtEpochMs
        internal var updatedAtEpochMs: Double {
          get {
            return snapshot["updatedAtEpochMs"]! as! Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
          }
        }

        /// State of funding source.
        internal var state: FundingSourceState {
          get {
            return snapshot["state"]! as! FundingSourceState
          }
          set {
            snapshot.updateValue(newValue, forKey: "state")
          }
        }

        /// Currency that funding source is denominated in.
        internal var currency: String {
          get {
            return snapshot["currency"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "currency")
          }
        }

        /// The unique fingerprint of the funding source.
        internal var fingerprint: GraphQLID {
          get {
            return snapshot["fingerprint"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "fingerprint")
          }
        }

        /// Last 4 digits of user's bank account number.
        internal var last4: String {
          get {
            return snapshot["last4"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "last4")
          }
        }

        /// Bank account type
        internal var bankAccountType: BankAccountType {
          get {
            return snapshot["bankAccountType"]! as! BankAccountType
          }
          set {
            snapshot.updateValue(newValue, forKey: "bankAccountType")
          }
        }

        /// The signed authorization providing authority to transact on the bank account.
        internal var authorization: Authorization {
          get {
            return Authorization(snapshot: snapshot["authorization"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "authorization")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var adminFundingSource: AdminFundingSource {
            get {
              return AdminFundingSource(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal var bankAccountFundingSource: BankAccountFundingSource {
            get {
              return BankAccountFundingSource(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        internal struct Authorization: GraphQLSelectionSet {
          internal static let possibleTypes = ["SignedAuthorizationText"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("data", type: .nonNull(.scalar(String.self))),
            GraphQLField("signature", type: .nonNull(.scalar(String.self))),
            GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
            GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
            GraphQLField("content", type: .nonNull(.scalar(String.self))),
            GraphQLField("contentType", type: .nonNull(.scalar(String.self))),
            GraphQLField("language", type: .nonNull(.scalar(String.self))),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(data: String, signature: String, algorithm: String, keyId: String, content: String, contentType: String, language: String) {
            self.init(snapshot: ["__typename": "SignedAuthorizationText", "data": data, "signature": signature, "algorithm": algorithm, "keyId": keyId, "content": content, "contentType": contentType, "language": language])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Data that is signed. This is a serialised JSON document of the form:
          /// {
          /// "hash":"<base64-encoded-hash-of-authorization-agreement-text-agreed-to>",
          /// "hashAlgorithm":"<algorithm-used-to-hash-the-agreement-text>",
          /// "signedAt":"<ISO8601-UTC-timestamp-of-time-signature-generated>",
          /// "account":"<unique-identifier-of-account-agreement-pertains-to>",
          /// }
          internal var data: String {
            get {
              return snapshot["data"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "data")
            }
          }

          /// Base64 encoded signature of the data
          internal var signature: String {
            get {
              return snapshot["signature"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "signature")
            }
          }

          /// Algorithm used to generate the signature.
          internal var algorithm: String {
            get {
              return snapshot["algorithm"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "algorithm")
            }
          }

          /// ID of internal key registered with the virtual cards service corresponding
          /// to the private key used to generate the signature
          internal var keyId: String {
            get {
              return snapshot["keyId"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "keyId")
            }
          }

          /// Full content of the agreement
          internal var content: String {
            get {
              return snapshot["content"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "content")
            }
          }

          /// Content type of the agreement. For example text/plain or text/html.
          internal var contentType: String {
            get {
              return snapshot["contentType"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "contentType")
            }
          }

          /// RFC 5646 language tag specifying the language of the agreement
          internal var language: String {
            get {
              return snapshot["language"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "language")
            }
          }

          internal var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          internal struct Fragments {
            internal var snapshot: Snapshot

            internal var signedAuthorizationText: SignedAuthorizationText {
              get {
                return SignedAuthorizationText(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }
        }
      }
    }
  }
}

internal final class GetPlaidSandboxDataQuery: GraphQLQuery {
  internal static let operationString =
    "query GetPlaidSandboxData($input: GetPlaidSandboxDataRequest!) {\n  getPlaidSandboxData(input: $input) {\n    __typename\n    accountMetadata {\n      __typename\n      accountId\n      subtype\n    }\n    publicToken\n  }\n}"

  internal var input: GetPlaidSandboxDataRequest

  internal init(input: GetPlaidSandboxDataRequest) {
    self.input = input
  }

  internal var variables: GraphQLMap? {
    return ["input": input]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Query"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("getPlaidSandboxData", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(GetPlaidSandboxDatum.selections))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(getPlaidSandboxData: GetPlaidSandboxDatum) {
      self.init(snapshot: ["__typename": "Query", "getPlaidSandboxData": getPlaidSandboxData.snapshot])
    }

    /// Generates and returns the Plaid sandbox internal token and account id required to
    /// provide information to build the bank account funding source completion data.
    internal var getPlaidSandboxData: GetPlaidSandboxDatum {
      get {
        return GetPlaidSandboxDatum(snapshot: snapshot["getPlaidSandboxData"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "getPlaidSandboxData")
      }
    }

    internal struct GetPlaidSandboxDatum: GraphQLSelectionSet {
      internal static let possibleTypes = ["GetPlaidSandboxDataResponse"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("accountMetadata", type: .nonNull(.list(.nonNull(.object(AccountMetadatum.selections))))),
        GraphQLField("publicToken", type: .nonNull(.scalar(String.self))),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(accountMetadata: [AccountMetadatum], publicToken: String) {
        self.init(snapshot: ["__typename": "GetPlaidSandboxDataResponse", "accountMetadata": accountMetadata.map { $0.snapshot }, "publicToken": publicToken])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Metadata of the bank account including ID and subtype.
      internal var accountMetadata: [AccountMetadatum] {
        get {
          return (snapshot["accountMetadata"] as! [Snapshot]).map { AccountMetadatum(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "accountMetadata")
        }
      }

      /// The internal token that is required to build completion data for creating
      /// a bank account funding source.
      internal var publicToken: String {
        get {
          return snapshot["publicToken"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "publicToken")
        }
      }

      internal struct AccountMetadatum: GraphQLSelectionSet {
        internal static let possibleTypes = ["PlaidAccountMetadata"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("accountId", type: .nonNull(.scalar(String.self))),
          GraphQLField("subtype", type: .scalar(String.self)),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(accountId: String, subtype: String? = nil) {
          self.init(snapshot: ["__typename": "PlaidAccountMetadata", "accountId": accountId, "subtype": subtype])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// ID of the bank account.
        internal var accountId: String {
          get {
            return snapshot["accountId"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "accountId")
          }
        }

        /// Bank account subtype. E.g. checking, saving etc.
        internal var subtype: String? {
          get {
            return snapshot["subtype"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "subtype")
          }
        }
      }
    }
  }
}

internal struct CreditCardFundingSource: GraphQLFragment {
  internal static let fragmentString =
    "fragment CreditCardFundingSource on CreditCardFundingSource {\n  __typename\n  id\n  owner\n  version\n  createdAtEpochMs\n  updatedAtEpochMs\n  state\n  currency\n  fingerprint\n  last4\n  cardType\n  network\n}"

  internal static let possibleTypes = ["CreditCardFundingSource"]

  internal static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("version", type: .nonNull(.scalar(Int.self))),
    GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
    GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
    GraphQLField("state", type: .nonNull(.scalar(FundingSourceState.self))),
    GraphQLField("currency", type: .nonNull(.scalar(String.self))),
    GraphQLField("fingerprint", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("last4", type: .nonNull(.scalar(String.self))),
    GraphQLField("cardType", type: .nonNull(.scalar(CardType.self))),
    GraphQLField("network", type: .nonNull(.scalar(CreditCardNetwork.self))),
  ]

  internal var snapshot: Snapshot

  internal init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, fingerprint: GraphQLID, last4: String, cardType: CardType, network: CreditCardNetwork) {
    self.init(snapshot: ["__typename": "CreditCardFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "fingerprint": fingerprint, "last4": last4, "cardType": cardType, "network": network])
  }

  internal var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  /// See CommonObject.id
  internal var id: GraphQLID {
    get {
      return snapshot["id"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  /// See CommonObject.owner
  internal var owner: GraphQLID {
    get {
      return snapshot["owner"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "owner")
    }
  }

  /// See CommonObject.version
  internal var version: Int {
    get {
      return snapshot["version"]! as! Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "version")
    }
  }

  /// See CommonObject.createdAtEpochMs
  internal var createdAtEpochMs: Double {
    get {
      return snapshot["createdAtEpochMs"]! as! Double
    }
    set {
      snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
    }
  }

  /// See CommonObject.updatedAtEpochMs
  internal var updatedAtEpochMs: Double {
    get {
      return snapshot["updatedAtEpochMs"]! as! Double
    }
    set {
      snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
    }
  }

  /// See CommonFundingSource.state
  internal var state: FundingSourceState {
    get {
      return snapshot["state"]! as! FundingSourceState
    }
    set {
      snapshot.updateValue(newValue, forKey: "state")
    }
  }

  /// See CommonFundingSource.currency
  internal var currency: String {
    get {
      return snapshot["currency"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "currency")
    }
  }

  /// See CommonFundingSource.fingerprint
  internal var fingerprint: GraphQLID {
    get {
      return snapshot["fingerprint"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "fingerprint")
    }
  }

  /// Last 4 digits of user's credit card
  internal var last4: String {
    get {
      return snapshot["last4"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "last4")
    }
  }

  /// Type of card
  internal var cardType: CardType {
    get {
      return snapshot["cardType"]! as! CardType
    }
    set {
      snapshot.updateValue(newValue, forKey: "cardType")
    }
  }

  /// Card network of card
  internal var network: CreditCardNetwork {
    get {
      return snapshot["network"]! as! CreditCardNetwork
    }
    set {
      snapshot.updateValue(newValue, forKey: "network")
    }
  }
}

internal struct BankAccountFundingSource: GraphQLFragment {
  internal static let fragmentString =
    "fragment BankAccountFundingSource on BankAccountFundingSource {\n  __typename\n  id\n  owner\n  version\n  createdAtEpochMs\n  updatedAtEpochMs\n  state\n  currency\n  fingerprint\n  last4\n  bankAccountType\n  authorization {\n    __typename\n    ...SignedAuthorizationText\n  }\n}"

  internal static let possibleTypes = ["BankAccountFundingSource"]

  internal static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("version", type: .nonNull(.scalar(Int.self))),
    GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
    GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
    GraphQLField("state", type: .nonNull(.scalar(FundingSourceState.self))),
    GraphQLField("currency", type: .nonNull(.scalar(String.self))),
    GraphQLField("fingerprint", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("last4", type: .nonNull(.scalar(String.self))),
    GraphQLField("bankAccountType", type: .nonNull(.scalar(BankAccountType.self))),
    GraphQLField("authorization", type: .nonNull(.object(Authorization.selections))),
  ]

  internal var snapshot: Snapshot

  internal init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, fingerprint: GraphQLID, last4: String, bankAccountType: BankAccountType, authorization: Authorization) {
    self.init(snapshot: ["__typename": "BankAccountFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "fingerprint": fingerprint, "last4": last4, "bankAccountType": bankAccountType, "authorization": authorization.snapshot])
  }

  internal var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  /// See CommonObject.id
  internal var id: GraphQLID {
    get {
      return snapshot["id"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  /// See CommonObject.owner
  internal var owner: GraphQLID {
    get {
      return snapshot["owner"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "owner")
    }
  }

  /// See CommonObject.version
  internal var version: Int {
    get {
      return snapshot["version"]! as! Int
    }
    set {
      snapshot.updateValue(newValue, forKey: "version")
    }
  }

  /// See CommonObject.createdAtEpochMs
  internal var createdAtEpochMs: Double {
    get {
      return snapshot["createdAtEpochMs"]! as! Double
    }
    set {
      snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
    }
  }

  /// See CommonObject.updatedAtEpochMs
  internal var updatedAtEpochMs: Double {
    get {
      return snapshot["updatedAtEpochMs"]! as! Double
    }
    set {
      snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
    }
  }

  /// State of funding source.
  internal var state: FundingSourceState {
    get {
      return snapshot["state"]! as! FundingSourceState
    }
    set {
      snapshot.updateValue(newValue, forKey: "state")
    }
  }

  /// Currency that funding source is denominated in.
  internal var currency: String {
    get {
      return snapshot["currency"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "currency")
    }
  }

  /// The unique fingerprint of the funding source.
  internal var fingerprint: GraphQLID {
    get {
      return snapshot["fingerprint"]! as! GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "fingerprint")
    }
  }

  /// Last 4 digits of user's bank account number.
  internal var last4: String {
    get {
      return snapshot["last4"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "last4")
    }
  }

  /// Bank account type
  internal var bankAccountType: BankAccountType {
    get {
      return snapshot["bankAccountType"]! as! BankAccountType
    }
    set {
      snapshot.updateValue(newValue, forKey: "bankAccountType")
    }
  }

  /// The signed authorization providing authority to transact on the bank account.
  internal var authorization: Authorization {
    get {
      return Authorization(snapshot: snapshot["authorization"]! as! Snapshot)
    }
    set {
      snapshot.updateValue(newValue.snapshot, forKey: "authorization")
    }
  }

  internal struct Authorization: GraphQLSelectionSet {
    internal static let possibleTypes = ["SignedAuthorizationText"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("data", type: .nonNull(.scalar(String.self))),
      GraphQLField("signature", type: .nonNull(.scalar(String.self))),
      GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
      GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
      GraphQLField("content", type: .nonNull(.scalar(String.self))),
      GraphQLField("contentType", type: .nonNull(.scalar(String.self))),
      GraphQLField("language", type: .nonNull(.scalar(String.self))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(data: String, signature: String, algorithm: String, keyId: String, content: String, contentType: String, language: String) {
      self.init(snapshot: ["__typename": "SignedAuthorizationText", "data": data, "signature": signature, "algorithm": algorithm, "keyId": keyId, "content": content, "contentType": contentType, "language": language])
    }

    internal var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    /// Data that is signed. This is a serialised JSON document of the form:
    /// {
    /// "hash":"<base64-encoded-hash-of-authorization-agreement-text-agreed-to>",
    /// "hashAlgorithm":"<algorithm-used-to-hash-the-agreement-text>",
    /// "signedAt":"<ISO8601-UTC-timestamp-of-time-signature-generated>",
    /// "account":"<unique-identifier-of-account-agreement-pertains-to>",
    /// }
    internal var data: String {
      get {
        return snapshot["data"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "data")
      }
    }

    /// Base64 encoded signature of the data
    internal var signature: String {
      get {
        return snapshot["signature"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "signature")
      }
    }

    /// Algorithm used to generate the signature.
    internal var algorithm: String {
      get {
        return snapshot["algorithm"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "algorithm")
      }
    }

    /// ID of internal key registered with the virtual cards service corresponding
    /// to the private key used to generate the signature
    internal var keyId: String {
      get {
        return snapshot["keyId"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "keyId")
      }
    }

    /// Full content of the agreement
    internal var content: String {
      get {
        return snapshot["content"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "content")
      }
    }

    /// Content type of the agreement. For example text/plain or text/html.
    internal var contentType: String {
      get {
        return snapshot["contentType"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "contentType")
      }
    }

    /// RFC 5646 language tag specifying the language of the agreement
    internal var language: String {
      get {
        return snapshot["language"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "language")
      }
    }

    internal var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    internal struct Fragments {
      internal var snapshot: Snapshot

      internal var signedAuthorizationText: SignedAuthorizationText {
        get {
          return SignedAuthorizationText(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }
  }
}

internal struct AdminFundingSource: GraphQLFragment {
  internal static let fragmentString =
    "fragment AdminFundingSource on FundingSource {\n  __typename\n  ... on CreditCardFundingSource {\n    ...CreditCardFundingSource\n  }\n  ... on BankAccountFundingSource {\n    ...BankAccountFundingSource\n  }\n}"

  internal static let possibleTypes = ["BankAccountFundingSource", "CreditCardFundingSource"]

  internal static let selections: [GraphQLSelection] = [
    GraphQLTypeCase(
      variants: ["CreditCardFundingSource": AsCreditCardFundingSource.selections, "BankAccountFundingSource": AsBankAccountFundingSource.selections],
      default: [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      ]
    )
  ]

  internal var snapshot: Snapshot

  internal init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  internal static func makeCreditCardFundingSource(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, fingerprint: GraphQLID, last4: String, cardType: CardType, network: CreditCardNetwork) -> AdminFundingSource {
    return AdminFundingSource(snapshot: ["__typename": "CreditCardFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "fingerprint": fingerprint, "last4": last4, "cardType": cardType, "network": network])
  }

  internal static func makeBankAccountFundingSource(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, fingerprint: GraphQLID, last4: String, bankAccountType: BankAccountType, authorization: AsBankAccountFundingSource.Authorization) -> AdminFundingSource {
    return AdminFundingSource(snapshot: ["__typename": "BankAccountFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "fingerprint": fingerprint, "last4": last4, "bankAccountType": bankAccountType, "authorization": authorization.snapshot])
  }

  internal var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  internal var asCreditCardFundingSource: AsCreditCardFundingSource? {
    get {
      if !AsCreditCardFundingSource.possibleTypes.contains(__typename) { return nil }
      return AsCreditCardFundingSource(snapshot: snapshot)
    }
    set {
      guard let newValue = newValue else { return }
      snapshot = newValue.snapshot
    }
  }

  internal struct AsCreditCardFundingSource: GraphQLSelectionSet {
    internal static let possibleTypes = ["CreditCardFundingSource"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("version", type: .nonNull(.scalar(Int.self))),
      GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
      GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
      GraphQLField("state", type: .nonNull(.scalar(FundingSourceState.self))),
      GraphQLField("currency", type: .nonNull(.scalar(String.self))),
      GraphQLField("fingerprint", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("last4", type: .nonNull(.scalar(String.self))),
      GraphQLField("cardType", type: .nonNull(.scalar(CardType.self))),
      GraphQLField("network", type: .nonNull(.scalar(CreditCardNetwork.self))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, fingerprint: GraphQLID, last4: String, cardType: CardType, network: CreditCardNetwork) {
      self.init(snapshot: ["__typename": "CreditCardFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "fingerprint": fingerprint, "last4": last4, "cardType": cardType, "network": network])
    }

    internal var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    /// See CommonObject.id
    internal var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    /// See CommonObject.owner
    internal var owner: GraphQLID {
      get {
        return snapshot["owner"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "owner")
      }
    }

    /// See CommonObject.version
    internal var version: Int {
      get {
        return snapshot["version"]! as! Int
      }
      set {
        snapshot.updateValue(newValue, forKey: "version")
      }
    }

    /// See CommonObject.createdAtEpochMs
    internal var createdAtEpochMs: Double {
      get {
        return snapshot["createdAtEpochMs"]! as! Double
      }
      set {
        snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
      }
    }

    /// See CommonObject.updatedAtEpochMs
    internal var updatedAtEpochMs: Double {
      get {
        return snapshot["updatedAtEpochMs"]! as! Double
      }
      set {
        snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
      }
    }

    /// See CommonFundingSource.state
    internal var state: FundingSourceState {
      get {
        return snapshot["state"]! as! FundingSourceState
      }
      set {
        snapshot.updateValue(newValue, forKey: "state")
      }
    }

    /// See CommonFundingSource.currency
    internal var currency: String {
      get {
        return snapshot["currency"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "currency")
      }
    }

    /// See CommonFundingSource.fingerprint
    internal var fingerprint: GraphQLID {
      get {
        return snapshot["fingerprint"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "fingerprint")
      }
    }

    /// Last 4 digits of user's credit card
    internal var last4: String {
      get {
        return snapshot["last4"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "last4")
      }
    }

    /// Type of card
    internal var cardType: CardType {
      get {
        return snapshot["cardType"]! as! CardType
      }
      set {
        snapshot.updateValue(newValue, forKey: "cardType")
      }
    }

    /// Card network of card
    internal var network: CreditCardNetwork {
      get {
        return snapshot["network"]! as! CreditCardNetwork
      }
      set {
        snapshot.updateValue(newValue, forKey: "network")
      }
    }

    internal var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    internal struct Fragments {
      internal var snapshot: Snapshot

      internal var creditCardFundingSource: CreditCardFundingSource {
        get {
          return CreditCardFundingSource(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }
  }

  internal var asBankAccountFundingSource: AsBankAccountFundingSource? {
    get {
      if !AsBankAccountFundingSource.possibleTypes.contains(__typename) { return nil }
      return AsBankAccountFundingSource(snapshot: snapshot)
    }
    set {
      guard let newValue = newValue else { return }
      snapshot = newValue.snapshot
    }
  }

  internal struct AsBankAccountFundingSource: GraphQLSelectionSet {
    internal static let possibleTypes = ["BankAccountFundingSource"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("owner", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("version", type: .nonNull(.scalar(Int.self))),
      GraphQLField("createdAtEpochMs", type: .nonNull(.scalar(Double.self))),
      GraphQLField("updatedAtEpochMs", type: .nonNull(.scalar(Double.self))),
      GraphQLField("state", type: .nonNull(.scalar(FundingSourceState.self))),
      GraphQLField("currency", type: .nonNull(.scalar(String.self))),
      GraphQLField("fingerprint", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("last4", type: .nonNull(.scalar(String.self))),
      GraphQLField("bankAccountType", type: .nonNull(.scalar(BankAccountType.self))),
      GraphQLField("authorization", type: .nonNull(.object(Authorization.selections))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(id: GraphQLID, owner: GraphQLID, version: Int, createdAtEpochMs: Double, updatedAtEpochMs: Double, state: FundingSourceState, currency: String, fingerprint: GraphQLID, last4: String, bankAccountType: BankAccountType, authorization: Authorization) {
      self.init(snapshot: ["__typename": "BankAccountFundingSource", "id": id, "owner": owner, "version": version, "createdAtEpochMs": createdAtEpochMs, "updatedAtEpochMs": updatedAtEpochMs, "state": state, "currency": currency, "fingerprint": fingerprint, "last4": last4, "bankAccountType": bankAccountType, "authorization": authorization.snapshot])
    }

    internal var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    /// See CommonObject.id
    internal var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    /// See CommonObject.owner
    internal var owner: GraphQLID {
      get {
        return snapshot["owner"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "owner")
      }
    }

    /// See CommonObject.version
    internal var version: Int {
      get {
        return snapshot["version"]! as! Int
      }
      set {
        snapshot.updateValue(newValue, forKey: "version")
      }
    }

    /// See CommonObject.createdAtEpochMs
    internal var createdAtEpochMs: Double {
      get {
        return snapshot["createdAtEpochMs"]! as! Double
      }
      set {
        snapshot.updateValue(newValue, forKey: "createdAtEpochMs")
      }
    }

    /// See CommonObject.updatedAtEpochMs
    internal var updatedAtEpochMs: Double {
      get {
        return snapshot["updatedAtEpochMs"]! as! Double
      }
      set {
        snapshot.updateValue(newValue, forKey: "updatedAtEpochMs")
      }
    }

    /// State of funding source.
    internal var state: FundingSourceState {
      get {
        return snapshot["state"]! as! FundingSourceState
      }
      set {
        snapshot.updateValue(newValue, forKey: "state")
      }
    }

    /// Currency that funding source is denominated in.
    internal var currency: String {
      get {
        return snapshot["currency"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "currency")
      }
    }

    /// The unique fingerprint of the funding source.
    internal var fingerprint: GraphQLID {
      get {
        return snapshot["fingerprint"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "fingerprint")
      }
    }

    /// Last 4 digits of user's bank account number.
    internal var last4: String {
      get {
        return snapshot["last4"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "last4")
      }
    }

    /// Bank account type
    internal var bankAccountType: BankAccountType {
      get {
        return snapshot["bankAccountType"]! as! BankAccountType
      }
      set {
        snapshot.updateValue(newValue, forKey: "bankAccountType")
      }
    }

    /// The signed authorization providing authority to transact on the bank account.
    internal var authorization: Authorization {
      get {
        return Authorization(snapshot: snapshot["authorization"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "authorization")
      }
    }

    internal var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    internal struct Fragments {
      internal var snapshot: Snapshot

      internal var bankAccountFundingSource: BankAccountFundingSource {
        get {
          return BankAccountFundingSource(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }

    internal struct Authorization: GraphQLSelectionSet {
      internal static let possibleTypes = ["SignedAuthorizationText"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("data", type: .nonNull(.scalar(String.self))),
        GraphQLField("signature", type: .nonNull(.scalar(String.self))),
        GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
        GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
        GraphQLField("content", type: .nonNull(.scalar(String.self))),
        GraphQLField("contentType", type: .nonNull(.scalar(String.self))),
        GraphQLField("language", type: .nonNull(.scalar(String.self))),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(data: String, signature: String, algorithm: String, keyId: String, content: String, contentType: String, language: String) {
        self.init(snapshot: ["__typename": "SignedAuthorizationText", "data": data, "signature": signature, "algorithm": algorithm, "keyId": keyId, "content": content, "contentType": contentType, "language": language])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Data that is signed. This is a serialised JSON document of the form:
      /// {
      /// "hash":"<base64-encoded-hash-of-authorization-agreement-text-agreed-to>",
      /// "hashAlgorithm":"<algorithm-used-to-hash-the-agreement-text>",
      /// "signedAt":"<ISO8601-UTC-timestamp-of-time-signature-generated>",
      /// "account":"<unique-identifier-of-account-agreement-pertains-to>",
      /// }
      internal var data: String {
        get {
          return snapshot["data"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "data")
        }
      }

      /// Base64 encoded signature of the data
      internal var signature: String {
        get {
          return snapshot["signature"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "signature")
        }
      }

      /// Algorithm used to generate the signature.
      internal var algorithm: String {
        get {
          return snapshot["algorithm"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "algorithm")
        }
      }

      /// ID of internal key registered with the virtual cards service corresponding
      /// to the private key used to generate the signature
      internal var keyId: String {
        get {
          return snapshot["keyId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "keyId")
        }
      }

      /// Full content of the agreement
      internal var content: String {
        get {
          return snapshot["content"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "content")
        }
      }

      /// Content type of the agreement. For example text/plain or text/html.
      internal var contentType: String {
        get {
          return snapshot["contentType"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "contentType")
        }
      }

      /// RFC 5646 language tag specifying the language of the agreement
      internal var language: String {
        get {
          return snapshot["language"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "language")
        }
      }

      internal var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      internal struct Fragments {
        internal var snapshot: Snapshot

        internal var signedAuthorizationText: SignedAuthorizationText {
          get {
            return SignedAuthorizationText(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }
    }
  }
}

internal struct SignedAuthorizationText: GraphQLFragment {
  internal static let fragmentString =
    "fragment SignedAuthorizationText on SignedAuthorizationText {\n  __typename\n  data\n  signature\n  algorithm\n  keyId\n  content\n  contentType\n  language\n}"

  internal static let possibleTypes = ["SignedAuthorizationText"]

  internal static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("data", type: .nonNull(.scalar(String.self))),
    GraphQLField("signature", type: .nonNull(.scalar(String.self))),
    GraphQLField("algorithm", type: .nonNull(.scalar(String.self))),
    GraphQLField("keyId", type: .nonNull(.scalar(String.self))),
    GraphQLField("content", type: .nonNull(.scalar(String.self))),
    GraphQLField("contentType", type: .nonNull(.scalar(String.self))),
    GraphQLField("language", type: .nonNull(.scalar(String.self))),
  ]

  internal var snapshot: Snapshot

  internal init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  internal init(data: String, signature: String, algorithm: String, keyId: String, content: String, contentType: String, language: String) {
    self.init(snapshot: ["__typename": "SignedAuthorizationText", "data": data, "signature": signature, "algorithm": algorithm, "keyId": keyId, "content": content, "contentType": contentType, "language": language])
  }

  internal var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  /// Data that is signed. This is a serialised JSON document of the form:
  /// {
  /// "hash":"<base64-encoded-hash-of-authorization-agreement-text-agreed-to>",
  /// "hashAlgorithm":"<algorithm-used-to-hash-the-agreement-text>",
  /// "signedAt":"<ISO8601-UTC-timestamp-of-time-signature-generated>",
  /// "account":"<unique-identifier-of-account-agreement-pertains-to>",
  /// }
  internal var data: String {
    get {
      return snapshot["data"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "data")
    }
  }

  /// Base64 encoded signature of the data
  internal var signature: String {
    get {
      return snapshot["signature"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "signature")
    }
  }

  /// Algorithm used to generate the signature.
  internal var algorithm: String {
    get {
      return snapshot["algorithm"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "algorithm")
    }
  }

  /// ID of internal key registered with the virtual cards service corresponding
  /// to the private key used to generate the signature
  internal var keyId: String {
    get {
      return snapshot["keyId"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "keyId")
    }
  }

  /// Full content of the agreement
  internal var content: String {
    get {
      return snapshot["content"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "content")
    }
  }

  /// Content type of the agreement. For example text/plain or text/html.
  internal var contentType: String {
    get {
      return snapshot["contentType"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "contentType")
    }
  }

  /// RFC 5646 language tag specifying the language of the agreement
  internal var language: String {
    get {
      return snapshot["language"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "language")
    }
  }
}
}