// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class PokedexQuery: GraphQLQuery {
  public static let operationName: String = "pokedex"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      query pokedex($name: String) {
        pokemon_v2_pokedex(where: {name: {_eq: $name}}) {
          __typename
          pokemon_v2_pokemondexnumbers(order_by: {pokedex_number: asc}) {
            __typename
            pokedex_number
            pokemon_v2_pokemonspecy {
              __typename
              id
              name
              pokemon_v2_pokemons {
                __typename
                pokemon_v2_pokemontypes {
                  __typename
                  pokemon_v2_type {
                    __typename
                    name
                  }
                }
                pokemon_v2_pokemonstats {
                  __typename
                  effort
                  base_stat
                  pokemon_v2_stat {
                    __typename
                    name
                  }
                }
              }
            }
          }
        }
      }
      """
    ))

  public var name: GraphQLNullable<String>

  public init(name: GraphQLNullable<String>) {
    self.name = name
  }

  public var __variables: Variables? { ["name": name] }

  public struct Data: PokeAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PokeAPI.Objects.Query_root }
    public static var __selections: [Selection] { [
      .field("pokemon_v2_pokedex", [Pokemon_v2_pokedex].self, arguments: ["where": ["name": ["_eq": .variable("name")]]]),
    ] }

    /// fetch data from the table: "pokemon_v2_pokedex"
    public var pokemon_v2_pokedex: [Pokemon_v2_pokedex] { __data["pokemon_v2_pokedex"] }

    /// Pokemon_v2_pokedex
    ///
    /// Parent Type: `Pokemon_v2_pokedex`
    public struct Pokemon_v2_pokedex: PokeAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_pokedex }
      public static var __selections: [Selection] { [
        .field("pokemon_v2_pokemondexnumbers", [Pokemon_v2_pokemondexnumber].self, arguments: ["order_by": ["pokedex_number": "asc"]]),
      ] }

      /// An array relationship
      public var pokemon_v2_pokemondexnumbers: [Pokemon_v2_pokemondexnumber] { __data["pokemon_v2_pokemondexnumbers"] }

      /// Pokemon_v2_pokedex.Pokemon_v2_pokemondexnumber
      ///
      /// Parent Type: `Pokemon_v2_pokemondexnumber`
      public struct Pokemon_v2_pokemondexnumber: PokeAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_pokemondexnumber }
        public static var __selections: [Selection] { [
          .field("pokedex_number", Int.self),
          .field("pokemon_v2_pokemonspecy", Pokemon_v2_pokemonspecy?.self),
        ] }

        public var pokedex_number: Int { __data["pokedex_number"] }
        /// An object relationship
        public var pokemon_v2_pokemonspecy: Pokemon_v2_pokemonspecy? { __data["pokemon_v2_pokemonspecy"] }

        /// Pokemon_v2_pokedex.Pokemon_v2_pokemondexnumber.Pokemon_v2_pokemonspecy
        ///
        /// Parent Type: `Pokemon_v2_pokemonspecies`
        public struct Pokemon_v2_pokemonspecy: PokeAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_pokemonspecies }
          public static var __selections: [Selection] { [
            .field("id", Int.self),
            .field("name", String.self),
            .field("pokemon_v2_pokemons", [Pokemon_v2_pokemon].self),
          ] }

          public var id: Int { __data["id"] }
          public var name: String { __data["name"] }
          /// An array relationship
          public var pokemon_v2_pokemons: [Pokemon_v2_pokemon] { __data["pokemon_v2_pokemons"] }

          /// Pokemon_v2_pokedex.Pokemon_v2_pokemondexnumber.Pokemon_v2_pokemonspecy.Pokemon_v2_pokemon
          ///
          /// Parent Type: `Pokemon_v2_pokemon`
          public struct Pokemon_v2_pokemon: PokeAPI.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_pokemon }
            public static var __selections: [Selection] { [
              .field("pokemon_v2_pokemontypes", [Pokemon_v2_pokemontype].self),
              .field("pokemon_v2_pokemonstats", [Pokemon_v2_pokemonstat].self),
            ] }

            /// An array relationship
            public var pokemon_v2_pokemontypes: [Pokemon_v2_pokemontype] { __data["pokemon_v2_pokemontypes"] }
            /// An array relationship
            public var pokemon_v2_pokemonstats: [Pokemon_v2_pokemonstat] { __data["pokemon_v2_pokemonstats"] }

            /// Pokemon_v2_pokedex.Pokemon_v2_pokemondexnumber.Pokemon_v2_pokemonspecy.Pokemon_v2_pokemon.Pokemon_v2_pokemontype
            ///
            /// Parent Type: `Pokemon_v2_pokemontype`
            public struct Pokemon_v2_pokemontype: PokeAPI.SelectionSet {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_pokemontype }
              public static var __selections: [Selection] { [
                .field("pokemon_v2_type", Pokemon_v2_type?.self),
              ] }

              /// An object relationship
              public var pokemon_v2_type: Pokemon_v2_type? { __data["pokemon_v2_type"] }

              /// Pokemon_v2_pokedex.Pokemon_v2_pokemondexnumber.Pokemon_v2_pokemonspecy.Pokemon_v2_pokemon.Pokemon_v2_pokemontype.Pokemon_v2_type
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
            }

            /// Pokemon_v2_pokedex.Pokemon_v2_pokemondexnumber.Pokemon_v2_pokemonspecy.Pokemon_v2_pokemon.Pokemon_v2_pokemonstat
            ///
            /// Parent Type: `Pokemon_v2_pokemonstat`
            public struct Pokemon_v2_pokemonstat: PokeAPI.SelectionSet {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_pokemonstat }
              public static var __selections: [Selection] { [
                .field("effort", Int.self),
                .field("base_stat", Int.self),
                .field("pokemon_v2_stat", Pokemon_v2_stat?.self),
              ] }

              public var effort: Int { __data["effort"] }
              public var base_stat: Int { __data["base_stat"] }
              /// An object relationship
              public var pokemon_v2_stat: Pokemon_v2_stat? { __data["pokemon_v2_stat"] }

              /// Pokemon_v2_pokedex.Pokemon_v2_pokemondexnumber.Pokemon_v2_pokemonspecy.Pokemon_v2_pokemon.Pokemon_v2_pokemonstat.Pokemon_v2_stat
              ///
              /// Parent Type: `Pokemon_v2_stat`
              public struct Pokemon_v2_stat: PokeAPI.SelectionSet {
                public let __data: DataDict
                public init(data: DataDict) { __data = data }

                public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_stat }
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
  }
}
