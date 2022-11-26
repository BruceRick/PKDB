// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class PokemonEvolutionsQuery: GraphQLQuery {
  public static let operationName: String = "pokemonEvolutions"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      query pokemonEvolutions($pokemon: String) {
        pokemon_v2_evolutionchain(
          where: {pokemon_v2_pokemonspecies: {name: {_eq: $pokemon}}}
        ) {
          __typename
          pokemon_v2_pokemonspecies(order_by: {order: asc}) {
            __typename
            id
            name
            pokemon_v2_pokemonevolutions {
              __typename
              id
              min_level
              min_happiness
              min_beauty
              min_affection
              time_of_day
              pokemon_v2_evolutiontrigger {
                __typename
                name
              }
              pokemon_v2_item {
                __typename
                name
              }
              pokemon_v2_location {
                __typename
                name
              }
              pokemon_v2_gender {
                __typename
                name
              }
              pokemonV2ItemByHeldItemId {
                __typename
                name
              }
            }
          }
        }
      }
      """
    ))

  public var pokemon: GraphQLNullable<String>

  public init(pokemon: GraphQLNullable<String>) {
    self.pokemon = pokemon
  }

  public var __variables: Variables? { ["pokemon": pokemon] }

  public struct Data: PokeAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PokeAPI.Objects.Query_root }
    public static var __selections: [Selection] { [
      .field("pokemon_v2_evolutionchain", [Pokemon_v2_evolutionchain].self, arguments: ["where": ["pokemon_v2_pokemonspecies": ["name": ["_eq": .variable("pokemon")]]]]),
    ] }

    /// fetch data from the table: "pokemon_v2_evolutionchain"
    public var pokemon_v2_evolutionchain: [Pokemon_v2_evolutionchain] { __data["pokemon_v2_evolutionchain"] }

    /// Pokemon_v2_evolutionchain
    ///
    /// Parent Type: `Pokemon_v2_evolutionchain`
    public struct Pokemon_v2_evolutionchain: PokeAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_evolutionchain }
      public static var __selections: [Selection] { [
        .field("pokemon_v2_pokemonspecies", [Pokemon_v2_pokemonspecy].self, arguments: ["order_by": ["order": "asc"]]),
      ] }

      /// An array relationship
      public var pokemon_v2_pokemonspecies: [Pokemon_v2_pokemonspecy] { __data["pokemon_v2_pokemonspecies"] }

      /// Pokemon_v2_evolutionchain.Pokemon_v2_pokemonspecy
      ///
      /// Parent Type: `Pokemon_v2_pokemonspecies`
      public struct Pokemon_v2_pokemonspecy: PokeAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_pokemonspecies }
        public static var __selections: [Selection] { [
          .field("id", Int.self),
          .field("name", String.self),
          .field("pokemon_v2_pokemonevolutions", [Pokemon_v2_pokemonevolution].self),
        ] }

        public var id: Int { __data["id"] }
        public var name: String { __data["name"] }
        /// An array relationship
        public var pokemon_v2_pokemonevolutions: [Pokemon_v2_pokemonevolution] { __data["pokemon_v2_pokemonevolutions"] }

        /// Pokemon_v2_evolutionchain.Pokemon_v2_pokemonspecy.Pokemon_v2_pokemonevolution
        ///
        /// Parent Type: `Pokemon_v2_pokemonevolution`
        public struct Pokemon_v2_pokemonevolution: PokeAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_pokemonevolution }
          public static var __selections: [Selection] { [
            .field("id", Int.self),
            .field("min_level", Int?.self),
            .field("min_happiness", Int?.self),
            .field("min_beauty", Int?.self),
            .field("min_affection", Int?.self),
            .field("time_of_day", String?.self),
            .field("pokemon_v2_evolutiontrigger", Pokemon_v2_evolutiontrigger?.self),
            .field("pokemon_v2_item", Pokemon_v2_item?.self),
            .field("pokemon_v2_location", Pokemon_v2_location?.self),
            .field("pokemon_v2_gender", Pokemon_v2_gender?.self),
            .field("pokemonV2ItemByHeldItemId", PokemonV2ItemByHeldItemId?.self),
          ] }

          public var id: Int { __data["id"] }
          public var min_level: Int? { __data["min_level"] }
          public var min_happiness: Int? { __data["min_happiness"] }
          public var min_beauty: Int? { __data["min_beauty"] }
          public var min_affection: Int? { __data["min_affection"] }
          public var time_of_day: String? { __data["time_of_day"] }
          /// An object relationship
          public var pokemon_v2_evolutiontrigger: Pokemon_v2_evolutiontrigger? { __data["pokemon_v2_evolutiontrigger"] }
          /// An object relationship
          public var pokemon_v2_item: Pokemon_v2_item? { __data["pokemon_v2_item"] }
          /// An object relationship
          public var pokemon_v2_location: Pokemon_v2_location? { __data["pokemon_v2_location"] }
          /// An object relationship
          public var pokemon_v2_gender: Pokemon_v2_gender? { __data["pokemon_v2_gender"] }
          /// An object relationship
          public var pokemonV2ItemByHeldItemId: PokemonV2ItemByHeldItemId? { __data["pokemonV2ItemByHeldItemId"] }

          /// Pokemon_v2_evolutionchain.Pokemon_v2_pokemonspecy.Pokemon_v2_pokemonevolution.Pokemon_v2_evolutiontrigger
          ///
          /// Parent Type: `Pokemon_v2_evolutiontrigger`
          public struct Pokemon_v2_evolutiontrigger: PokeAPI.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_evolutiontrigger }
            public static var __selections: [Selection] { [
              .field("name", String.self),
            ] }

            public var name: String { __data["name"] }
          }

          /// Pokemon_v2_evolutionchain.Pokemon_v2_pokemonspecy.Pokemon_v2_pokemonevolution.Pokemon_v2_item
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

          /// Pokemon_v2_evolutionchain.Pokemon_v2_pokemonspecy.Pokemon_v2_pokemonevolution.Pokemon_v2_location
          ///
          /// Parent Type: `Pokemon_v2_location`
          public struct Pokemon_v2_location: PokeAPI.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_location }
            public static var __selections: [Selection] { [
              .field("name", String.self),
            ] }

            public var name: String { __data["name"] }
          }

          /// Pokemon_v2_evolutionchain.Pokemon_v2_pokemonspecy.Pokemon_v2_pokemonevolution.Pokemon_v2_gender
          ///
          /// Parent Type: `Pokemon_v2_gender`
          public struct Pokemon_v2_gender: PokeAPI.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_gender }
            public static var __selections: [Selection] { [
              .field("name", String.self),
            ] }

            public var name: String { __data["name"] }
          }

          /// Pokemon_v2_evolutionchain.Pokemon_v2_pokemonspecy.Pokemon_v2_pokemonevolution.PokemonV2ItemByHeldItemId
          ///
          /// Parent Type: `Pokemon_v2_item`
          public struct PokemonV2ItemByHeldItemId: PokeAPI.SelectionSet {
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
    }
  }
}
