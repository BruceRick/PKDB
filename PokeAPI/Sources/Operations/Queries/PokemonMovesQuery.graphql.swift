// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class PokemonMovesQuery: GraphQLQuery {
  public static let operationName: String = "pokemonMoves"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      query pokemonMoves($pokemon: String, $game: String) {
        pokemon_v2_pokemonmove(
          where: {pokemon_v2_versiongroup: {pokemon_v2_versions: {pokemon_v2_versionnames: {pokemon_v2_version: {name: {_eq: $game}}}}}, pokemon_v2_pokemon: {name: {_eq: $pokemon}}}
        ) {
          __typename
          id
          level
          pokemon_v2_move {
            __typename
            name
            power
            pokemon_v2_type {
              __typename
              name
            }
            pokemon_v2_movedamageclass {
              __typename
              name
            }
            pokemon_v2_machines(
              where: {pokemon_v2_versiongroup: {pokemon_v2_versions: {pokemon_v2_versionnames: {pokemon_v2_version: {name: {_eq: $game}}}}}}
            ) {
              __typename
              pokemon_v2_item {
                __typename
                name
              }
            }
          }
          pokemon_v2_movelearnmethod {
            __typename
            name
          }
        }
      }
      """
    ))

  public var pokemon: GraphQLNullable<String>
  public var game: GraphQLNullable<String>

  public init(
    pokemon: GraphQLNullable<String>,
    game: GraphQLNullable<String>
  ) {
    self.pokemon = pokemon
    self.game = game
  }

  public var __variables: Variables? { [
    "pokemon": pokemon,
    "game": game
  ] }

  public struct Data: PokeAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PokeAPI.Objects.Query_root }
    public static var __selections: [Selection] { [
      .field("pokemon_v2_pokemonmove", [Pokemon_v2_pokemonmove].self, arguments: ["where": [
        "pokemon_v2_versiongroup": ["pokemon_v2_versions": ["pokemon_v2_versionnames": ["pokemon_v2_version": ["name": ["_eq": .variable("game")]]]]],
        "pokemon_v2_pokemon": ["name": ["_eq": .variable("pokemon")]]
      ]]),
    ] }

    /// fetch data from the table: "pokemon_v2_pokemonmove"
    public var pokemon_v2_pokemonmove: [Pokemon_v2_pokemonmove] { __data["pokemon_v2_pokemonmove"] }

    /// Pokemon_v2_pokemonmove
    ///
    /// Parent Type: `Pokemon_v2_pokemonmove`
    public struct Pokemon_v2_pokemonmove: PokeAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_pokemonmove }
      public static var __selections: [Selection] { [
        .field("id", Int.self),
        .field("level", Int.self),
        .field("pokemon_v2_move", Pokemon_v2_move?.self),
        .field("pokemon_v2_movelearnmethod", Pokemon_v2_movelearnmethod?.self),
      ] }

      public var id: Int { __data["id"] }
      public var level: Int { __data["level"] }
      /// An object relationship
      public var pokemon_v2_move: Pokemon_v2_move? { __data["pokemon_v2_move"] }
      /// An object relationship
      public var pokemon_v2_movelearnmethod: Pokemon_v2_movelearnmethod? { __data["pokemon_v2_movelearnmethod"] }

      /// Pokemon_v2_pokemonmove.Pokemon_v2_move
      ///
      /// Parent Type: `Pokemon_v2_move`
      public struct Pokemon_v2_move: PokeAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_move }
        public static var __selections: [Selection] { [
          .field("name", String.self),
          .field("power", Int?.self),
          .field("pokemon_v2_type", Pokemon_v2_type?.self),
          .field("pokemon_v2_movedamageclass", Pokemon_v2_movedamageclass?.self),
          .field("pokemon_v2_machines", [Pokemon_v2_machine].self, arguments: ["where": ["pokemon_v2_versiongroup": ["pokemon_v2_versions": ["pokemon_v2_versionnames": ["pokemon_v2_version": ["name": ["_eq": .variable("game")]]]]]]]),
        ] }

        public var name: String { __data["name"] }
        public var power: Int? { __data["power"] }
        /// An object relationship
        public var pokemon_v2_type: Pokemon_v2_type? { __data["pokemon_v2_type"] }
        /// An object relationship
        public var pokemon_v2_movedamageclass: Pokemon_v2_movedamageclass? { __data["pokemon_v2_movedamageclass"] }
        /// An array relationship
        public var pokemon_v2_machines: [Pokemon_v2_machine] { __data["pokemon_v2_machines"] }

        /// Pokemon_v2_pokemonmove.Pokemon_v2_move.Pokemon_v2_type
        ///
        /// Parent Type: `Pokemon_v2_type`
        public struct Pokemon_v2_type: PokeAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_type }
          public static var __selections: [Selection] { [
            .field("name", String.self),
          ] }

          public var name: String { __data["name"] }
        }

        /// Pokemon_v2_pokemonmove.Pokemon_v2_move.Pokemon_v2_movedamageclass
        ///
        /// Parent Type: `Pokemon_v2_movedamageclass`
        public struct Pokemon_v2_movedamageclass: PokeAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_movedamageclass }
          public static var __selections: [Selection] { [
            .field("name", String.self),
          ] }

          public var name: String { __data["name"] }
        }

        /// Pokemon_v2_pokemonmove.Pokemon_v2_move.Pokemon_v2_machine
        ///
        /// Parent Type: `Pokemon_v2_machine`
        public struct Pokemon_v2_machine: PokeAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_machine }
          public static var __selections: [Selection] { [
            .field("pokemon_v2_item", Pokemon_v2_item?.self),
          ] }

          /// An object relationship
          public var pokemon_v2_item: Pokemon_v2_item? { __data["pokemon_v2_item"] }

          /// Pokemon_v2_pokemonmove.Pokemon_v2_move.Pokemon_v2_machine.Pokemon_v2_item
          ///
          /// Parent Type: `Pokemon_v2_item`
          public struct Pokemon_v2_item: PokeAPI.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_item }
            public static var __selections: [Selection] { [
              .field("name", String.self),
            ] }

            public var name: String { __data["name"] }
          }
        }
      }

      /// Pokemon_v2_pokemonmove.Pokemon_v2_movelearnmethod
      ///
      /// Parent Type: `Pokemon_v2_movelearnmethod`
      public struct Pokemon_v2_movelearnmethod: PokeAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_movelearnmethod }
        public static var __selections: [Selection] { [
          .field("name", String.self),
        ] }

        public var name: String { __data["name"] }
      }
    }
  }
}
