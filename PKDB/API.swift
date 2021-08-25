// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class PokedexesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query pokedexes {
      pokemon_v2_pokedex {
        __typename
        name
      }
    }
    """

  public let operationName: String = "pokedexes"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("pokemon_v2_pokedex", type: .nonNull(.list(.nonNull(.object(PokemonV2Pokedex.selections))))),
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
              pokemon_v2_pokemonsprites {
                __typename
                sprites
              }
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
                GraphQLField("pokemon_v2_pokemonsprites", type: .nonNull(.list(.nonNull(.object(PokemonV2Pokemonsprite.selections))))),
                GraphQLField("pokemon_v2_pokemontypes", type: .nonNull(.list(.nonNull(.object(PokemonV2Pokemontype.selections))))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(pokemonV2Pokemonsprites: [PokemonV2Pokemonsprite], pokemonV2Pokemontypes: [PokemonV2Pokemontype]) {
              self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemon", "pokemon_v2_pokemonsprites": pokemonV2Pokemonsprites.map { (value: PokemonV2Pokemonsprite) -> ResultMap in value.resultMap }, "pokemon_v2_pokemontypes": pokemonV2Pokemontypes.map { (value: PokemonV2Pokemontype) -> ResultMap in value.resultMap }])
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
            public var pokemonV2Pokemonsprites: [PokemonV2Pokemonsprite] {
              get {
                return (resultMap["pokemon_v2_pokemonsprites"] as! [ResultMap]).map { (value: ResultMap) -> PokemonV2Pokemonsprite in PokemonV2Pokemonsprite(unsafeResultMap: value) }
              }
              set {
                resultMap.updateValue(newValue.map { (value: PokemonV2Pokemonsprite) -> ResultMap in value.resultMap }, forKey: "pokemon_v2_pokemonsprites")
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
