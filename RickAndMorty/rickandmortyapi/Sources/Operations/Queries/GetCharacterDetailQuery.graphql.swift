// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetCharacterDetailQuery: GraphQLQuery {
  public static let operationName: String = "GetCharacterDetail"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetCharacterDetail($id: ID!) { character(id: $id) { __typename ...CharacterInfo status gender origin { __typename name } location { __typename name type dimension } episode { __typename name episode } } }"#,
      fragments: [CharacterInfo.self]
    ))

  public var id: ID

  public init(id: ID) {
    self.id = id
  }

  public var __variables: Variables? { ["id": id] }

  public struct Data: Rickandmortyapi.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { Rickandmortyapi.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("character", Character?.self, arguments: ["id": .variable("id")]),
    ] }

    /// Get a specific character by ID
    public var character: Character? { __data["character"] }

    /// Character
    ///
    /// Parent Type: `Character`
    public struct Character: Rickandmortyapi.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { Rickandmortyapi.Objects.Character }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("status", String?.self),
        .field("gender", String?.self),
        .field("origin", Origin?.self),
        .field("location", Location?.self),
        .field("episode", [Episode?].self),
        .fragment(CharacterInfo.self),
      ] }

      /// The status of the character ('Alive', 'Dead' or 'unknown').
      public var status: String? { __data["status"] }
      /// The gender of the character ('Female', 'Male', 'Genderless' or 'unknown').
      public var gender: String? { __data["gender"] }
      /// The character's origin location
      public var origin: Origin? { __data["origin"] }
      /// The character's last known location
      public var location: Location? { __data["location"] }
      /// Episodes in which this character appeared.
      public var episode: [Episode?] { __data["episode"] }
      /// The id of the character.
      public var id: Rickandmortyapi.ID? { __data["id"] }
      /// The name of the character.
      public var name: String? { __data["name"] }
      /// Link to the character's image.
      /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
      public var image: String? { __data["image"] }
      /// The species of the character.
      public var species: String? { __data["species"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var characterInfo: CharacterInfo { _toFragment() }
      }

      /// Character.Origin
      ///
      /// Parent Type: `Location`
      public struct Origin: Rickandmortyapi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { Rickandmortyapi.Objects.Location }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("name", String?.self),
        ] }

        /// The name of the location.
        public var name: String? { __data["name"] }
      }

      /// Character.Location
      ///
      /// Parent Type: `Location`
      public struct Location: Rickandmortyapi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { Rickandmortyapi.Objects.Location }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("name", String?.self),
          .field("type", String?.self),
          .field("dimension", String?.self),
        ] }

        /// The name of the location.
        public var name: String? { __data["name"] }
        /// The type of the location.
        public var type: String? { __data["type"] }
        /// The dimension in which the location is located.
        public var dimension: String? { __data["dimension"] }
      }

      /// Character.Episode
      ///
      /// Parent Type: `Episode`
      public struct Episode: Rickandmortyapi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { Rickandmortyapi.Objects.Episode }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("name", String?.self),
          .field("episode", String?.self),
        ] }

        /// The name of the episode.
        public var name: String? { __data["name"] }
        /// The code of the episode.
        public var episode: String? { __data["episode"] }
      }
    }
  }
}
