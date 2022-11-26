// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class PokemonTypesQuery: GraphQLQuery {
  public static let operationName: String = "pokemonTypes"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      query pokemonTypes {
        pokemon_v2_type {
          __typename
          name
          pokemon_v2_typeefficacies {
            __typename
            damage_factor
            pokemonV2TypeByTargetTypeId {
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
      .field("pokemon_v2_type", [Pokemon_v2_type].self),
    ] }

    /// fetch data from the table: "pokemon_v2_type"
    public var pokemon_v2_type: [Pokemon_v2_type] { __data["pokemon_v2_type"] }

    /// Pokemon_v2_type
    ///
    /// Parent Type: `Pokemon_v2_type`
    public struct Pokemon_v2_type: PokeAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_type }
      public static var __selections: [Selection] { [
        .field("name", String.self),
        .field("pokemon_v2_typeefficacies", [Pokemon_v2_typeefficacy].self),
      ] }

      public var name: String { __data["name"] }
      /// An array relationship
      public var pokemon_v2_typeefficacies: [Pokemon_v2_typeefficacy] { __data["pokemon_v2_typeefficacies"] }

      /// Pokemon_v2_type.Pokemon_v2_typeefficacy
      ///
      /// Parent Type: `Pokemon_v2_typeefficacy`
      public struct Pokemon_v2_typeefficacy: PokeAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_typeefficacy }
        public static var __selections: [Selection] { [
          .field("damage_factor", Int.self),
          .field("pokemonV2TypeByTargetTypeId", PokemonV2TypeByTargetTypeId?.self),
        ] }

        public var damage_factor: Int { __data["damage_factor"] }
        /// An object relationship
        public var pokemonV2TypeByTargetTypeId: PokemonV2TypeByTargetTypeId? { __data["pokemonV2TypeByTargetTypeId"] }

        /// Pokemon_v2_type.Pokemon_v2_typeefficacy.PokemonV2TypeByTargetTypeId
        ///
        /// Parent Type: `Pokemon_v2_type`
        public struct PokemonV2TypeByTargetTypeId: PokeAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { PokeAPI.Objects.Pokemon_v2_type }
          public static var __selections: [Selection] { [
            .field("name", String.self),
          ] }

          public var name: String { __data["name"] }
        }
      }
    }
  }
}
