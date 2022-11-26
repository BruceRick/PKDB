// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class PokemonDetailsQuery: GraphQLQuery {
  public static let operationName: String = "pokemonDetails"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      query pokemonDetails($pokemon: String, $game: String, $languageId: Int) {
        pokemon_v2_pokemon(where: {name: {_eq: $pokemon}}) {
          __typename
          id
          height
          weight
          base_experience
          pokemon_v2_pokemonspecy {
            __typename
            pokemon_v2_pokemonspeciesflavortexts(
              where: {language_id: {_eq: $languageId}, pokemon_v2_version: {name: {_eq: $game}}}
            ) {
              __typename
              flavor_text
            }
            pokemon_v2_pokemonspeciesnames(where: {language_id: {_eq: $languageId}}) {
              __typename
              genus
            }
            evolution_chain_id
          }
          pokemon_v2_pokemontypes {
            __typename
            pokemon_v2_type {
              __typename
              name
            }
          }
          pokemon_v2_pokemonabilities {
            __typename
            is_hidden
            pokemon_v2_ability {
              __typename
              name
              pokemon_v2_abilityeffecttexts(where: {language_id: {_eq: $languageId}}) {
                __typename
                effect
              }
              pokemon_v2_abilityflavortexts(
                where: {language_id: {_eq: $languageId}, pokemon_v2_versiongroup: {pokemon_v2_versions: {name: {_eq: $game}}}}
              ) {
                __typename
                flavor_text
              }
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
          pokemon_v2_pokemonsprites {
            __typename
            sprites
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
        .field("id", Int.self),
        .field("height", Int?.self),
        .field("weight", Int?.self),
        .field("base_experience", Int?.self),
        .field("pokemon_v2_pokemonspecy", Pokemon_v2_pokemonspecy?.self),
        .field("pokemon_v2_pokemontypes", [Pokemon_v2_pokemontype].self),
        .field("pokemon_v2_pokemonabilities", [Pokemon_v2_pokemonability].self),
        .field("pokemon_v2_pokemonstats", [Pokemon_v2_pokemonstat].self),
        .field("pokemon_v2_pokemonsprites", [Pokemon_v2_pokemonsprite].self),
      ] }

      public var id: Int { __data["id"] }
      public var height: Int? { __data["height"] }
      public var weight: Int? { __data["weight"] }
      public var base_experience: Int? { __data["base_experience"] }
      /// An object relationship
      public var pokemon_v2_pokemonspecy: Pokemon_v2_pokemonspecy? { __data["pokemon_v2_pokemonspecy"] }
      /// An array relationship
      public var pokemon_v2_pokemontypes: [Pokemon_v2_pokemontype] { __data["pokemon_v2_pokemontypes"] }
      /// An array relationship
      public var pokemon_v2_pokemonabilities: [Pokemon_v2_pokemonability] { __data["pokemon_v2_pokemonabilities"] }
      /// An array relationship
      public var pokemon_v2_pokemonstats: [Pokemon_v2_pokemonstat] { __data["pokemon_v2_pokemonstats"] }
      /// An array relationship
      public var pokemon_v2_pokemonsprites: [Pokemon_v2_pokemonsprite] { __data["pokemon_v2_pokemonsprites"] }

      /// Pokemon_v2_pokemon.Pokemon_v2_pokemonspecy
      ///
      /// Parent Type: `Pokemon_v2_pokemonspecies`
      public struct Pokemon_v2_pokemonspecy: PokeAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_pokemonspecies }
        public static var __selections: [Selection] { [
          .field("pokemon_v2_pokemonspeciesflavortexts", [Pokemon_v2_pokemonspeciesflavortext].self, arguments: ["where": [
            "language_id": ["_eq": .variable("languageId")],
            "pokemon_v2_version": ["name": ["_eq": .variable("game")]]
          ]]),
          .field("pokemon_v2_pokemonspeciesnames", [Pokemon_v2_pokemonspeciesname].self, arguments: ["where": ["language_id": ["_eq": .variable("languageId")]]]),
          .field("evolution_chain_id", Int?.self),
        ] }

        /// An array relationship
        public var pokemon_v2_pokemonspeciesflavortexts: [Pokemon_v2_pokemonspeciesflavortext] { __data["pokemon_v2_pokemonspeciesflavortexts"] }
        /// An array relationship
        public var pokemon_v2_pokemonspeciesnames: [Pokemon_v2_pokemonspeciesname] { __data["pokemon_v2_pokemonspeciesnames"] }
        public var evolution_chain_id: Int? { __data["evolution_chain_id"] }

        /// Pokemon_v2_pokemon.Pokemon_v2_pokemonspecy.Pokemon_v2_pokemonspeciesflavortext
        ///
        /// Parent Type: `Pokemon_v2_pokemonspeciesflavortext`
        public struct Pokemon_v2_pokemonspeciesflavortext: PokeAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_pokemonspeciesflavortext }
          public static var __selections: [Selection] { [
            .field("flavor_text", String.self),
          ] }

          public var flavor_text: String { __data["flavor_text"] }
        }

        /// Pokemon_v2_pokemon.Pokemon_v2_pokemonspecy.Pokemon_v2_pokemonspeciesname
        ///
        /// Parent Type: `Pokemon_v2_pokemonspeciesname`
        public struct Pokemon_v2_pokemonspeciesname: PokeAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_pokemonspeciesname }
          public static var __selections: [Selection] { [
            .field("genus", String.self),
          ] }

          public var genus: String { __data["genus"] }
        }
      }

      /// Pokemon_v2_pokemon.Pokemon_v2_pokemontype
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

        /// Pokemon_v2_pokemon.Pokemon_v2_pokemontype.Pokemon_v2_type
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

      /// Pokemon_v2_pokemon.Pokemon_v2_pokemonability
      ///
      /// Parent Type: `Pokemon_v2_pokemonability`
      public struct Pokemon_v2_pokemonability: PokeAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_pokemonability }
        public static var __selections: [Selection] { [
          .field("is_hidden", Bool.self),
          .field("pokemon_v2_ability", Pokemon_v2_ability?.self),
        ] }

        public var is_hidden: Bool { __data["is_hidden"] }
        /// An object relationship
        public var pokemon_v2_ability: Pokemon_v2_ability? { __data["pokemon_v2_ability"] }

        /// Pokemon_v2_pokemon.Pokemon_v2_pokemonability.Pokemon_v2_ability
        ///
        /// Parent Type: `Pokemon_v2_ability`
        public struct Pokemon_v2_ability: PokeAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_ability }
          public static var __selections: [Selection] { [
            .field("name", String.self),
            .field("pokemon_v2_abilityeffecttexts", [Pokemon_v2_abilityeffecttext].self, arguments: ["where": ["language_id": ["_eq": .variable("languageId")]]]),
            .field("pokemon_v2_abilityflavortexts", [Pokemon_v2_abilityflavortext].self, arguments: ["where": [
              "language_id": ["_eq": .variable("languageId")],
              "pokemon_v2_versiongroup": ["pokemon_v2_versions": ["name": ["_eq": .variable("game")]]]
            ]]),
          ] }

          public var name: String { __data["name"] }
          /// An array relationship
          public var pokemon_v2_abilityeffecttexts: [Pokemon_v2_abilityeffecttext] { __data["pokemon_v2_abilityeffecttexts"] }
          /// An array relationship
          public var pokemon_v2_abilityflavortexts: [Pokemon_v2_abilityflavortext] { __data["pokemon_v2_abilityflavortexts"] }

          /// Pokemon_v2_pokemon.Pokemon_v2_pokemonability.Pokemon_v2_ability.Pokemon_v2_abilityeffecttext
          ///
          /// Parent Type: `Pokemon_v2_abilityeffecttext`
          public struct Pokemon_v2_abilityeffecttext: PokeAPI.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_abilityeffecttext }
            public static var __selections: [Selection] { [
              .field("effect", String.self),
            ] }

            public var effect: String { __data["effect"] }
          }

          /// Pokemon_v2_pokemon.Pokemon_v2_pokemonability.Pokemon_v2_ability.Pokemon_v2_abilityflavortext
          ///
          /// Parent Type: `Pokemon_v2_abilityflavortext`
          public struct Pokemon_v2_abilityflavortext: PokeAPI.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_abilityflavortext }
            public static var __selections: [Selection] { [
              .field("flavor_text", String.self),
            ] }

            public var flavor_text: String { __data["flavor_text"] }
          }
        }
      }

      /// Pokemon_v2_pokemon.Pokemon_v2_pokemonstat
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

        /// Pokemon_v2_pokemon.Pokemon_v2_pokemonstat.Pokemon_v2_stat
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

      /// Pokemon_v2_pokemon.Pokemon_v2_pokemonsprite
      ///
      /// Parent Type: `Pokemon_v2_pokemonsprites`
      public struct Pokemon_v2_pokemonsprite: PokeAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_pokemonsprites }
        public static var __selections: [Selection] { [
          .field("sprites", String.self),
        ] }

        public var sprites: String { __data["sprites"] }
      }
    }
  }
}
