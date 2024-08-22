// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct CharacterInfo: Rickandmortyapi.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment CharacterInfo on Character { __typename id name }"#
  }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: any ApolloAPI.ParentType { Rickandmortyapi.Objects.Character }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", Rickandmortyapi.ID?.self),
    .field("name", String?.self),
  ] }

  /// The id of the character.
  public var id: Rickandmortyapi.ID? { __data["id"] }
  /// The name of the character.
  public var name: String? { __data["name"] }
}
