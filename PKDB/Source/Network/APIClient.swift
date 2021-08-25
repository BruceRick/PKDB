//
//  Network.swift
//  PKDB
//
//  Created by Bruce Rick on 2021-06-18.
//

import Foundation
import Combine
import Apollo

struct API {
  static var client = ApolloClient(url: URL(string: "https://beta.pokeapi.co/graphql/v1beta")!)

  static private func request<Query: GraphQLQuery>(query: Query) -> Publishers.ApolloFetch<Query> {
    API.client.fetchPublisher(query: query)
  }

  static func pokedexes() -> AnyPublisher<[String]?, Error> {
    request(query: PokedexesQuery())
      .map {
        $0.data?.pokemonV2Pokedex.map { $0.name }
      }
      .eraseToAnyPublisher()
  }

  struct PokemonEntry {
    let name: String
    let number: Int
    let types: [String]
    let imageURL: String?
  }

  static func pokemonEntries(_ pokedex: String) -> AnyPublisher<[PokemonEntry]?, Error> {
    request(query: PokedexQuery(name: pokedex))
      .map {
        $0.data?.pokemonV2Pokedex.first?.pokemonV2Pokemondexnumbers.map {
          let name = $0.pokemonV2Pokemonspecy?.name ?? ""
          let number = $0.pokedexNumber
          let pokemon = $0.pokemonV2Pokemonspecy?.pokemonV2Pokemons.first
          let types  = pokemon?.pokemonV2Pokemontypes.map { $0.pokemonV2Type?.name }.compactMap { $0 } ?? []
          let imageURL = pokemon?.pokemonV2Pokemonsprites.first?.sprites ?? ""
          return .init(name: name, number: number, types: types, imageURL: imageURL)
        }
      }
      .eraseToAnyPublisher()
  }
}
