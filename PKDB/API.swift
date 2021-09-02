// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GamesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
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

  public let operationName: String = "games"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("pokemon_v2_versiongroup", type: .nonNull(.list(.nonNull(.object(PokemonV2Versiongroup.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(pokemonV2Versiongroup: [PokemonV2Versiongroup]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "pokemon_v2_versiongroup": pokemonV2Versiongroup.map { (value: PokemonV2Versiongroup) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "pokemon_v2_versiongroup"
    public var pokemonV2Versiongroup: [PokemonV2Versiongroup] {
      get {
        return (resultMap["pokemon_v2_versiongroup"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Versiongroup in PokemonV2Versiongroup(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: PokemonV2Versiongroup) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_versiongroup")
      }
    }

    public struct PokemonV2Versiongroup: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["pokemon_v2_versiongroup"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("pokemon_v2_versions", type: .nonNull(.list(.nonNull(.object(PokemonV2Version.selections))))),
          GraphQLField("pokemon_v2_pokedexversiongroups", type: .nonNull(.list(.nonNull(.object(PokemonV2Pokedexversiongroup.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(pokemonV2Versions: [PokemonV2Version], pokemonV2Pokedexversiongroups: [PokemonV2Pokedexversiongroup]) {
        self.init(unsafeResultMap: ["__typename": "pokemon_v2_versiongroup", "pokemon_v2_versions": pokemonV2Versions.map { (value: PokemonV2Version) -> ResultMap in value.resultMap }, "pokemon_v2_pokedexversiongroups": pokemonV2Pokedexversiongroups.map { (value: PokemonV2Pokedexversiongroup) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// An array relationship
      public var pokemonV2Versions: [PokemonV2Version] {
        get {
          return (resultMap["pokemon_v2_versions"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Version in PokemonV2Version(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: PokemonV2Version) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_versions")
        }
      }

      /// An array relationship
      public var pokemonV2Pokedexversiongroups: [PokemonV2Pokedexversiongroup] {
        get {
          return (resultMap["pokemon_v2_pokedexversiongroups"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokedexversiongroup in PokemonV2Pokedexversiongroup(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: PokemonV2Pokedexversiongroup) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokedexversiongroups")
        }
      }

      public struct PokemonV2Version: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["pokemon_v2_version"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String) {
          self.init(unsafeResultMap: ["__typename": "pokemon_v2_version", "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }

      public struct PokemonV2Pokedexversiongroup: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["pokemon_v2_pokedexversiongroup"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("pokemon_v2_pokedex", type: .object(PokemonV2Pokedex.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(pokemonV2Pokedex: PokemonV2Pokedex? = nil) {
          self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokedexversiongroup", "pokemon_v2_pokedex": pokemonV2Pokedex.flatMap { (value: PokemonV2Pokedex) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// An object relationship
        public var pokemonV2Pokedex: PokemonV2Pokedex? {
          get {
            return (resultMap["pokemon_v2_pokedex"] as? ResultMap).flatMap { PokemonV2Pokedex(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "pokemon_v2_pokedex")
          }
        }

        public struct PokemonV2Pokedex: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["pokemon_v2_pokedex"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String) {
            self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokedex", "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }
      }
    }
  }
}

public final class PokedexesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
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

  public let operationName: String = "pokedexes"

  public var game: String?

  public init(game: String? = nil) {
    self.game = game
  }

  public var variables: GraphQLMap? {
    return ["game": game]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("pokemon_v2_pokedex", arguments: ["where": ["pokemon_v2_pokedexversiongroups": ["pokemon_v2_versiongroup": ["pokemon_v2_versions": ["name": ["_eq": GraphQLVariable("game")]]]]]], type: .nonNull(.list(.nonNull(.object(PokemonV2Pokedex.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(pokemonV2Pokedex: [PokemonV2Pokedex]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "pokemon_v2_pokedex": pokemonV2Pokedex.map { (value: PokemonV2Pokedex) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "pokemon_v2_pokedex"
    public var pokemonV2Pokedex: [PokemonV2Pokedex] {
      get {
        return (resultMap["pokemon_v2_pokedex"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokedex in PokemonV2Pokedex(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: PokemonV2Pokedex) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokedex")
      }
    }

    public struct PokemonV2Pokedex: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["pokemon_v2_pokedex"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String) {
        self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokedex", "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public final class PokedexQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query pokedex($name: String) {
      pokemon_v2_pokedex(where: {name: {_eq: $name}}) {
        __typename
        pokemon_v2_pokemondexnumbers(order_by: {pokedex_number: asc}) {
          __typename
          pokedex_number
          pokemon_v2_pokemonspecy {
            __typename
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
            }
          }
        }
      }
    }
    """

  public let operationName: String = "pokedex"

  public var name: String?

  public init(name: String? = nil) {
    self.name = name
  }

  public var variables: GraphQLMap? {
    return ["name": name]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("pokemon_v2_pokedex", arguments: ["where": ["name": ["_eq": GraphQLVariable("name")]]], type: .nonNull(.list(.nonNull(.object(PokemonV2Pokedex.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(pokemonV2Pokedex: [PokemonV2Pokedex]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "pokemon_v2_pokedex": pokemonV2Pokedex.map { (value: PokemonV2Pokedex) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "pokemon_v2_pokedex"
    public var pokemonV2Pokedex: [PokemonV2Pokedex] {
      get {
        return (resultMap["pokemon_v2_pokedex"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokedex in PokemonV2Pokedex(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: PokemonV2Pokedex) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokedex")
      }
    }

    public struct PokemonV2Pokedex: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["pokemon_v2_pokedex"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("pokemon_v2_pokemondexnumbers", arguments: ["order_by": ["pokedex_number": "asc"]], type: .nonNull(.list(.nonNull(.object(PokemonV2Pokemondexnumber.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(pokemonV2Pokemondexnumbers: [PokemonV2Pokemondexnumber]) {
        self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokedex", "pokemon_v2_pokemondexnumbers": pokemonV2Pokemondexnumbers.map { (value: PokemonV2Pokemondexnumber) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// An array relationship
      public var pokemonV2Pokemondexnumbers: [PokemonV2Pokemondexnumber] {
        get {
          return (resultMap["pokemon_v2_pokemondexnumbers"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokemondexnumber in PokemonV2Pokemondexnumber(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: PokemonV2Pokemondexnumber) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokemondexnumbers")
        }
      }

      public struct PokemonV2Pokemondexnumber: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["pokemon_v2_pokemondexnumber"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("pokedex_number", type: .nonNull(.scalar(Int.self))),
            GraphQLField("pokemon_v2_pokemonspecy", type: .object(PokemonV2Pokemonspecy.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(pokedexNumber: Int, pokemonV2Pokemonspecy: PokemonV2Pokemonspecy? = nil) {
          self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemondexnumber", "pokedex_number": pokedexNumber, "pokemon_v2_pokemonspecy": pokemonV2Pokemonspecy.flatMap { (value: PokemonV2Pokemonspecy) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var pokedexNumber: Int {
          get {
            return resultMap["pokedex_number"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "pokedex_number")
          }
        }

        /// An object relationship
        public var pokemonV2Pokemonspecy: PokemonV2Pokemonspecy? {
          get {
            return (resultMap["pokemon_v2_pokemonspecy"] as? ResultMap).flatMap { PokemonV2Pokemonspecy(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "pokemon_v2_pokemonspecy")
          }
        }

        public struct PokemonV2Pokemonspecy: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["pokemon_v2_pokemonspecies"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("pokemon_v2_pokemons", type: .nonNull(.list(.nonNull(.object(PokemonV2Pokemon.selections))))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String, pokemonV2Pokemons: [PokemonV2Pokemon]) {
            self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemonspecies", "name": name, "pokemon_v2_pokemons": pokemonV2Pokemons.map { (value: PokemonV2Pokemon) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          /// An array relationship
          public var pokemonV2Pokemons: [PokemonV2Pokemon] {
            get {
              return (resultMap["pokemon_v2_pokemons"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokemon in PokemonV2Pokemon(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: PokemonV2Pokemon) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokemons")
            }
          }

          public struct PokemonV2Pokemon: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["pokemon_v2_pokemon"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("pokemon_v2_pokemontypes", type: .nonNull(.list(.nonNull(.object(PokemonV2Pokemontype.selections))))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(pokemonV2Pokemontypes: [PokemonV2Pokemontype]) {
              self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemon", "pokemon_v2_pokemontypes": pokemonV2Pokemontypes.map { (value: PokemonV2Pokemontype) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// An array relationship
            public var pokemonV2Pokemontypes: [PokemonV2Pokemontype] {
              get {
                return (resultMap["pokemon_v2_pokemontypes"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokemontype in PokemonV2Pokemontype(unsafeResultMap: value) }
              }
              set {
                resultMap.updateValue(newValue.map { (value: PokemonV2Pokemontype) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokemontypes")
              }
            }

            public struct PokemonV2Pokemontype: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["pokemon_v2_pokemontype"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("pokemon_v2_type", type: .object(PokemonV2Type.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(pokemonV2Type: PokemonV2Type? = nil) {
                self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemontype", "pokemon_v2_type": pokemonV2Type.flatMap { (value: PokemonV2Type) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// An object relationship
              public var pokemonV2Type: PokemonV2Type? {
                get {
                  return (resultMap["pokemon_v2_type"] as? ResultMap).flatMap { PokemonV2Type(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "pokemon_v2_type")
                }
              }

              public struct PokemonV2Type: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["pokemon_v2_type"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("name", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(name: String) {
                  self.init(unsafeResultMap: ["__typename": "pokemon_v2_type", "name": name])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var name: String {
                  get {
                    return resultMap["name"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "name")
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class PokemonDetailsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query pokemonDetails($pokemon: String, $game: String, $languageId: Int) {
      pokemon_v2_pokemon(where: {name: {_eq: $pokemon}}) {
        __typename
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

  public let operationName: String = "pokemonDetails"

  public var pokemon: String?
  public var game: String?
  public var languageId: Int?

  public init(pokemon: String? = nil, game: String? = nil, languageId: Int? = nil) {
    self.pokemon = pokemon
    self.game = game
    self.languageId = languageId
  }

  public var variables: GraphQLMap? {
    return ["pokemon": pokemon, "game": game, "languageId": languageId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("pokemon_v2_pokemon", arguments: ["where": ["name": ["_eq": GraphQLVariable("pokemon")]]], type: .nonNull(.list(.nonNull(.object(PokemonV2Pokemon.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(pokemonV2Pokemon: [PokemonV2Pokemon]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "pokemon_v2_pokemon": pokemonV2Pokemon.map { (value: PokemonV2Pokemon) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "pokemon_v2_pokemon"
    public var pokemonV2Pokemon: [PokemonV2Pokemon] {
      get {
        return (resultMap["pokemon_v2_pokemon"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokemon in PokemonV2Pokemon(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: PokemonV2Pokemon) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokemon")
      }
    }

    public struct PokemonV2Pokemon: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["pokemon_v2_pokemon"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("height", type: .scalar(Int.self)),
          GraphQLField("weight", type: .scalar(Int.self)),
          GraphQLField("base_experience", type: .scalar(Int.self)),
          GraphQLField("pokemon_v2_pokemonspecy", type: .object(PokemonV2Pokemonspecy.selections)),
          GraphQLField("pokemon_v2_pokemontypes", type: .nonNull(.list(.nonNull(.object(PokemonV2Pokemontype.selections))))),
          GraphQLField("pokemon_v2_pokemonabilities", type: .nonNull(.list(.nonNull(.object(PokemonV2Pokemonability.selections))))),
          GraphQLField("pokemon_v2_pokemonstats", type: .nonNull(.list(.nonNull(.object(PokemonV2Pokemonstat.selections))))),
          GraphQLField("pokemon_v2_pokemonsprites", type: .nonNull(.list(.nonNull(.object(PokemonV2Pokemonsprite.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(height: Int? = nil, weight: Int? = nil, baseExperience: Int? = nil, pokemonV2Pokemonspecy: PokemonV2Pokemonspecy? = nil, pokemonV2Pokemontypes: [PokemonV2Pokemontype], pokemonV2Pokemonabilities: [PokemonV2Pokemonability], pokemonV2Pokemonstats: [PokemonV2Pokemonstat], pokemonV2Pokemonsprites: [PokemonV2Pokemonsprite]) {
        self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemon", "height": height, "weight": weight, "base_experience": baseExperience, "pokemon_v2_pokemonspecy": pokemonV2Pokemonspecy.flatMap { (value: PokemonV2Pokemonspecy) -> ResultMap in value.resultMap }, "pokemon_v2_pokemontypes": pokemonV2Pokemontypes.map { (value: PokemonV2Pokemontype) -> ResultMap in value.resultMap }, "pokemon_v2_pokemonabilities": pokemonV2Pokemonabilities.map { (value: PokemonV2Pokemonability) -> ResultMap in value.resultMap }, "pokemon_v2_pokemonstats": pokemonV2Pokemonstats.map { (value: PokemonV2Pokemonstat) -> ResultMap in value.resultMap }, "pokemon_v2_pokemonsprites": pokemonV2Pokemonsprites.map { (value: PokemonV2Pokemonsprite) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var height: Int? {
        get {
          return resultMap["height"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "height")
        }
      }

      public var weight: Int? {
        get {
          return resultMap["weight"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "weight")
        }
      }

      public var baseExperience: Int? {
        get {
          return resultMap["base_experience"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "base_experience")
        }
      }

      /// An object relationship
      public var pokemonV2Pokemonspecy: PokemonV2Pokemonspecy? {
        get {
          return (resultMap["pokemon_v2_pokemonspecy"] as? ResultMap).flatMap { PokemonV2Pokemonspecy(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "pokemon_v2_pokemonspecy")
        }
      }

      /// An array relationship
      public var pokemonV2Pokemontypes: [PokemonV2Pokemontype] {
        get {
          return (resultMap["pokemon_v2_pokemontypes"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokemontype in PokemonV2Pokemontype(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: PokemonV2Pokemontype) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokemontypes")
        }
      }

      /// An array relationship
      public var pokemonV2Pokemonabilities: [PokemonV2Pokemonability] {
        get {
          return (resultMap["pokemon_v2_pokemonabilities"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokemonability in PokemonV2Pokemonability(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: PokemonV2Pokemonability) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokemonabilities")
        }
      }

      /// An array relationship
      public var pokemonV2Pokemonstats: [PokemonV2Pokemonstat] {
        get {
          return (resultMap["pokemon_v2_pokemonstats"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokemonstat in PokemonV2Pokemonstat(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: PokemonV2Pokemonstat) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokemonstats")
        }
      }

      /// An array relationship
      public var pokemonV2Pokemonsprites: [PokemonV2Pokemonsprite] {
        get {
          return (resultMap["pokemon_v2_pokemonsprites"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokemonsprite in PokemonV2Pokemonsprite(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: PokemonV2Pokemonsprite) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokemonsprites")
        }
      }

      public struct PokemonV2Pokemonspecy: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["pokemon_v2_pokemonspecies"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("pokemon_v2_pokemonspeciesflavortexts", arguments: ["where": ["language_id": ["_eq": GraphQLVariable("languageId")], "pokemon_v2_version": ["name": ["_eq": GraphQLVariable("game")]]]], type: .nonNull(.list(.nonNull(.object(PokemonV2Pokemonspeciesflavortext.selections))))),
            GraphQLField("pokemon_v2_pokemonspeciesnames", arguments: ["where": ["language_id": ["_eq": GraphQLVariable("languageId")]]], type: .nonNull(.list(.nonNull(.object(PokemonV2Pokemonspeciesname.selections))))),
            GraphQLField("evolution_chain_id", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(pokemonV2Pokemonspeciesflavortexts: [PokemonV2Pokemonspeciesflavortext], pokemonV2Pokemonspeciesnames: [PokemonV2Pokemonspeciesname], evolutionChainId: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemonspecies", "pokemon_v2_pokemonspeciesflavortexts": pokemonV2Pokemonspeciesflavortexts.map { (value: PokemonV2Pokemonspeciesflavortext) -> ResultMap in value.resultMap }, "pokemon_v2_pokemonspeciesnames": pokemonV2Pokemonspeciesnames.map { (value: PokemonV2Pokemonspeciesname) -> ResultMap in value.resultMap }, "evolution_chain_id": evolutionChainId])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// An array relationship
        public var pokemonV2Pokemonspeciesflavortexts: [PokemonV2Pokemonspeciesflavortext] {
          get {
            return (resultMap["pokemon_v2_pokemonspeciesflavortexts"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokemonspeciesflavortext in PokemonV2Pokemonspeciesflavortext(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: PokemonV2Pokemonspeciesflavortext) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokemonspeciesflavortexts")
          }
        }

        /// An array relationship
        public var pokemonV2Pokemonspeciesnames: [PokemonV2Pokemonspeciesname] {
          get {
            return (resultMap["pokemon_v2_pokemonspeciesnames"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokemonspeciesname in PokemonV2Pokemonspeciesname(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: PokemonV2Pokemonspeciesname) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokemonspeciesnames")
          }
        }

        public var evolutionChainId: Int? {
          get {
            return resultMap["evolution_chain_id"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "evolution_chain_id")
          }
        }

        public struct PokemonV2Pokemonspeciesflavortext: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["pokemon_v2_pokemonspeciesflavortext"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("flavor_text", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(flavorText: String) {
            self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemonspeciesflavortext", "flavor_text": flavorText])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var flavorText: String {
            get {
              return resultMap["flavor_text"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "flavor_text")
            }
          }
        }

        public struct PokemonV2Pokemonspeciesname: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["pokemon_v2_pokemonspeciesname"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("genus", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(genus: String) {
            self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemonspeciesname", "genus": genus])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var genus: String {
            get {
              return resultMap["genus"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "genus")
            }
          }
        }
      }

      public struct PokemonV2Pokemontype: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["pokemon_v2_pokemontype"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("pokemon_v2_type", type: .object(PokemonV2Type.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(pokemonV2Type: PokemonV2Type? = nil) {
          self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemontype", "pokemon_v2_type": pokemonV2Type.flatMap { (value: PokemonV2Type) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// An object relationship
        public var pokemonV2Type: PokemonV2Type? {
          get {
            return (resultMap["pokemon_v2_type"] as? ResultMap).flatMap { PokemonV2Type(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "pokemon_v2_type")
          }
        }

        public struct PokemonV2Type: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["pokemon_v2_type"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String) {
            self.init(unsafeResultMap: ["__typename": "pokemon_v2_type", "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }
      }

      public struct PokemonV2Pokemonability: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["pokemon_v2_pokemonability"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("is_hidden", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("pokemon_v2_ability", type: .object(PokemonV2Ability.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(isHidden: Bool, pokemonV2Ability: PokemonV2Ability? = nil) {
          self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemonability", "is_hidden": isHidden, "pokemon_v2_ability": pokemonV2Ability.flatMap { (value: PokemonV2Ability) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var isHidden: Bool {
          get {
            return resultMap["is_hidden"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "is_hidden")
          }
        }

        /// An object relationship
        public var pokemonV2Ability: PokemonV2Ability? {
          get {
            return (resultMap["pokemon_v2_ability"] as? ResultMap).flatMap { PokemonV2Ability(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "pokemon_v2_ability")
          }
        }

        public struct PokemonV2Ability: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["pokemon_v2_ability"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("pokemon_v2_abilityeffecttexts", arguments: ["where": ["language_id": ["_eq": GraphQLVariable("languageId")]]], type: .nonNull(.list(.nonNull(.object(PokemonV2Abilityeffecttext.selections))))),
              GraphQLField("pokemon_v2_abilityflavortexts", arguments: ["where": ["language_id": ["_eq": GraphQLVariable("languageId")], "pokemon_v2_versiongroup": ["pokemon_v2_versions": ["name": ["_eq": GraphQLVariable("game")]]]]], type: .nonNull(.list(.nonNull(.object(PokemonV2Abilityflavortext.selections))))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String, pokemonV2Abilityeffecttexts: [PokemonV2Abilityeffecttext], pokemonV2Abilityflavortexts: [PokemonV2Abilityflavortext]) {
            self.init(unsafeResultMap: ["__typename": "pokemon_v2_ability", "name": name, "pokemon_v2_abilityeffecttexts": pokemonV2Abilityeffecttexts.map { (value: PokemonV2Abilityeffecttext) -> ResultMap in value.resultMap }, "pokemon_v2_abilityflavortexts": pokemonV2Abilityflavortexts.map { (value: PokemonV2Abilityflavortext) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          /// An array relationship
          public var pokemonV2Abilityeffecttexts: [PokemonV2Abilityeffecttext] {
            get {
              return (resultMap["pokemon_v2_abilityeffecttexts"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Abilityeffecttext in PokemonV2Abilityeffecttext(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: PokemonV2Abilityeffecttext) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_abilityeffecttexts")
            }
          }

          /// An array relationship
          public var pokemonV2Abilityflavortexts: [PokemonV2Abilityflavortext] {
            get {
              return (resultMap["pokemon_v2_abilityflavortexts"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Abilityflavortext in PokemonV2Abilityflavortext(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: PokemonV2Abilityflavortext) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_abilityflavortexts")
            }
          }

          public struct PokemonV2Abilityeffecttext: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["pokemon_v2_abilityeffecttext"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("effect", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(effect: String) {
              self.init(unsafeResultMap: ["__typename": "pokemon_v2_abilityeffecttext", "effect": effect])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var effect: String {
              get {
                return resultMap["effect"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "effect")
              }
            }
          }

          public struct PokemonV2Abilityflavortext: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["pokemon_v2_abilityflavortext"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("flavor_text", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(flavorText: String) {
              self.init(unsafeResultMap: ["__typename": "pokemon_v2_abilityflavortext", "flavor_text": flavorText])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var flavorText: String {
              get {
                return resultMap["flavor_text"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "flavor_text")
              }
            }
          }
        }
      }

      public struct PokemonV2Pokemonstat: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["pokemon_v2_pokemonstat"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("effort", type: .nonNull(.scalar(Int.self))),
            GraphQLField("base_stat", type: .nonNull(.scalar(Int.self))),
            GraphQLField("pokemon_v2_stat", type: .object(PokemonV2Stat.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(effort: Int, baseStat: Int, pokemonV2Stat: PokemonV2Stat? = nil) {
          self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemonstat", "effort": effort, "base_stat": baseStat, "pokemon_v2_stat": pokemonV2Stat.flatMap { (value: PokemonV2Stat) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var effort: Int {
          get {
            return resultMap["effort"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "effort")
          }
        }

        public var baseStat: Int {
          get {
            return resultMap["base_stat"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "base_stat")
          }
        }

        /// An object relationship
        public var pokemonV2Stat: PokemonV2Stat? {
          get {
            return (resultMap["pokemon_v2_stat"] as? ResultMap).flatMap { PokemonV2Stat(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "pokemon_v2_stat")
          }
        }

        public struct PokemonV2Stat: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["pokemon_v2_stat"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String) {
            self.init(unsafeResultMap: ["__typename": "pokemon_v2_stat", "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }
      }

      public struct PokemonV2Pokemonsprite: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["pokemon_v2_pokemonsprites"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("sprites", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(sprites: String) {
          self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemonsprites", "sprites": sprites])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var sprites: String {
          get {
            return resultMap["sprites"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "sprites")
          }
        }
      }
    }
  }
}
