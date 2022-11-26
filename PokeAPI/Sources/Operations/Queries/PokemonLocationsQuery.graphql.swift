// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class PokemonLocationsQuery: GraphQLQuery {
  public static let operationName: String = "pokemonLocations"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      query pokemonLocations($pokemon: String, $game: String, $languageId: Int) {
        pokemon_v2_pokemon(where: {name: {_eq: $pokemon}}) {
          __typename
          pokemon_v2_encounters(where: {pokemon_v2_version: {name: {_eq: $game}}}) {
            __typename
            id
            min_level
            max_level
            pokemon_v2_locationarea {
              __typename
              pokemon_v2_location {
                __typename
                pokemon_v2_locationnames(where: {language_id: {_eq: $languageId}}) {
                  __typename
                  name
                }
              }
            }
            pokemon_v2_encounterslot {
              __typename
              pokemon_v2_encountermethod {
                __typename
                name
              }
              rarity
            }
          }
        }
      }
      """
    ))

  public var pokemon: GraphQLNullable<String>
  public var game: GraphQLNullable<String>
  public var languageId: GraphQLNullable<Int>

  public init(
    pokemon: GraphQLNullable<String>,
    game: GraphQLNullable<String>,
    languageId: GraphQLNullable<Int>
  ) {
    self.pokemon = pokemon
    self.game = game
    self.languageId = languageId
  }

  public var __variables: Variables? { [
    "pokemon": pokemon,
    "game": game,
    "languageId": languageId
  ] }

  public struct Data: PokeAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PokeAPI.Objects.Query_root }
    public static var __selections: [Selection] { [
      .field("pokemon_v2_pokemon", [Pokemon_v2_pokemon].self, arguments: ["where": ["name": ["_eq": .variable("pokemon")]]]),
    ] }

    /// fetch data from the table: "pokemon_v2_pokemon"
    public var pokemon_v2_pokemon: [Pokemon_v2_pokemon] { __data["pokemon_v2_pokemon"] }

    /// Pokemon_v2_pokemon
    ///
    /// Parent Type: `Pokemon_v2_pokemon`
    public struct Pokemon_v2_pokemon: PokeAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_pokemon }
      public static var __selections: [Selection] { [
        .field("pokemon_v2_encounters", [Pokemon_v2_encounter].self, arguments: ["where": ["pokemon_v2_version": ["name": ["_eq": .variable("game")]]]]),
      ] }

      /// An array relationship
      public var pokemon_v2_encounters: [Pokemon_v2_encounter] { __data["pokemon_v2_encounters"] }

      /// Pokemon_v2_pokemon.Pokemon_v2_encounter
      ///
      /// Parent Type: `Pokemon_v2_encounter`
      public struct Pokemon_v2_encounter: PokeAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_encounter }
        public static var __selections: [Selection] { [
          .field("id", Int.self),
          .field("min_level", Int.self),
          .field("max_level", Int.self),
          .field("pokemon_v2_locationarea", Pokemon_v2_locationarea?.self),
          .field("pokemon_v2_encounterslot", Pokemon_v2_encounterslot?.self),
        ] }

        public var id: Int { __data["id"] }
        public var min_level: Int { __data["min_level"] }
        public var max_level: Int { __data["max_level"] }
        /// An object relationship
        public var pokemon_v2_locationarea: Pokemon_v2_locationarea? { __data["pokemon_v2_locationarea"] }
        /// An object relationship
        public var pokemon_v2_encounterslot: Pokemon_v2_encounterslot? { __data["pokemon_v2_encounterslot"] }

        /// Pokemon_v2_pokemon.Pokemon_v2_encounter.Pokemon_v2_locationarea
        ///
        /// Parent Type: `Pokemon_v2_locationarea`
        public struct Pokemon_v2_locationarea: PokeAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_locationarea }
          public static var __selections: [Selection] { [
            .field("pokemon_v2_location", Pokemon_v2_location?.self),
          ] }

          /// An object relationship
          public var pokemon_v2_location: Pokemon_v2_location? { __data["pokemon_v2_location"] }

          /// Pokemon_v2_pokemon.Pokemon_v2_encounter.Pokemon_v2_locationarea.Pokemon_v2_location
          ///
          /// Parent Type: `Pokemon_v2_location`
          public struct Pokemon_v2_location: PokeAPI.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_location }
            public static var __selections: [Selection] { [
              .field("pokemon_v2_locationnames", [Pokemon_v2_locationname].self, arguments: ["where": ["language_id": ["_eq": .variable("languageId")]]]),
            ] }

            /// An array relationship
            public var pokemon_v2_locationnames: [Pokemon_v2_locationname] { __data["pokemon_v2_locationnames"] }

            /// Pokemon_v2_pokemon.Pokemon_v2_encounter.Pokemon_v2_locationarea.Pokemon_v2_location.Pokemon_v2_locationname
            ///
            /// Parent Type: `Pokemon_v2_locationname`
            public struct Pokemon_v2_locationname: PokeAPI.SelectionSet {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_locationname }
              public static var __selections: [Selection] { [
                .field("name", String.self),
              ] }

              public var name: String { __data["name"] }
            }
          }
        }

        /// Pokemon_v2_pokemon.Pokemon_v2_encounter.Pokemon_v2_encounterslot
        ///
        /// Parent Type: `Pokemon_v2_encounterslot`
        public struct Pokemon_v2_encounterslot: PokeAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_encounterslot }
          public static var __selections: [Selection] { [
            .field("pokemon_v2_encountermethod", Pokemon_v2_encountermethod?.self),
            .field("rarity", Int.self),
          ] }

          /// An object relationship
          public var pokemon_v2_encountermethod: Pokemon_v2_encountermethod? { __data["pokemon_v2_encountermethod"] }
          public var rarity: Int { __data["rarity"] }

          /// Pokemon_v2_pokemon.Pokemon_v2_encounter.Pokemon_v2_encounterslot.Pokemon_v2_encountermethod
          ///
          /// Parent Type: `Pokemon_v2_encountermethod`
          public struct Pokemon_v2_encountermethod: PokeAPI.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_encountermethod }
            public static var __selections: [Selection] { [
              .field("name", String.self),
            ] }

            public var name: String { __data["name"] }
          }
        }
      }
    }
  }
}
