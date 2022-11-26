// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GamesQuery: GraphQLQuery {
  public static let operationName: String = "games"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      query games {
        pokemon_v2_versiongroup {
          __typename
          pokemon_v2_versions {
            __typename
            name
          }
          pokemon_v2_pokedexversiongroups {
            __typename
            pokemon_v2_pokedex {
              __typename
              name
            }
          }
        }
      }
      """
    ))

  public init() {}

  public struct Data: PokeAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PokeAPI.Objects.Query_root }
    public static var __selections: [Selection] { [
      .field("pokemon_v2_versiongroup", [Pokemon_v2_versiongroup].self),
    ] }

    /// fetch data from the table: "pokemon_v2_versiongroup"
    public var pokemon_v2_versiongroup: [Pokemon_v2_versiongroup] { __data["pokemon_v2_versiongroup"] }

    /// Pokemon_v2_versiongroup
    ///
    /// Parent Type: `Pokemon_v2_versiongroup`
    public struct Pokemon_v2_versiongroup: PokeAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_versiongroup }
      public static var __selections: [Selection] { [
        .field("pokemon_v2_versions", [Pokemon_v2_version].self),
        .field("pokemon_v2_pokedexversiongroups", [Pokemon_v2_pokedexversiongroup].self),
      ] }

      /// An array relationship
      public var pokemon_v2_versions: [Pokemon_v2_version] { __data["pokemon_v2_versions"] }
      /// An array relationship
      public var pokemon_v2_pokedexversiongroups: [Pokemon_v2_pokedexversiongroup] { __data["pokemon_v2_pokedexversiongroups"] }

      /// Pokemon_v2_versiongroup.Pokemon_v2_version
      ///
      /// Parent Type: `Pokemon_v2_version`
      public struct Pokemon_v2_version: PokeAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_version }
        public static var __selections: [Selection] { [
          .field("name", String.self),
        ] }

        public var name: String { __data["name"] }
      }

      /// Pokemon_v2_versiongroup.Pokemon_v2_pokedexversiongroup
      ///
      /// Parent Type: `Pokemon_v2_pokedexversiongroup`
      public struct Pokemon_v2_pokedexversiongroup: PokeAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_pokedexversiongroup }
        public static var __selections: [Selection] { [
          .field("pokemon_v2_pokedex", Pokemon_v2_pokedex?.self),
        ] }

        /// An object relationship
        public var pokemon_v2_pokedex: Pokemon_v2_pokedex? { __data["pokemon_v2_pokedex"] }

        /// Pokemon_v2_versiongroup.Pokemon_v2_pokedexversiongroup.Pokemon_v2_pokedex
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
  }
}
