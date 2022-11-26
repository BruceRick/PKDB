// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class PokedexesQuery: GraphQLQuery {
  public static let operationName: String = "pokedexes"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      query pokedexes($game: String) {
        pokemon_v2_pokedex(
          where: {pokemon_v2_pokedexversiongroups: {pokemon_v2_versiongroup: {pokemon_v2_versions: {name: {_eq: $game}}}}}
        ) {
          __typename
          name
        }
      }
      """
    ))

  public var game: GraphQLNullable<String>

  public init(game: GraphQLNullable<String>) {
    self.game = game
  }

  public var __variables: Variables? { ["game": game] }

  public struct Data: PokeAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PokeAPI.Objects.Query_root }
    public static var __selections: [Selection] { [
      .field("pokemon_v2_pokedex", [Pokemon_v2_pokedex].self, arguments: ["where": ["pokemon_v2_pokedexversiongroups": ["pokemon_v2_versiongroup": ["pokemon_v2_versions": ["name": ["_eq": .variable("game")]]]]]]),
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
        .field("name", String.self),
      ] }

      public var name: String { __data["name"] }
    }
  }
}
