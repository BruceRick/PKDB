//
//  NetworkRequests.swift
//  PKDB
//
//  Created by Bruce Rick on 2021-08-25.
//

import Foundation
import Combine
import Apollo

extension API {
  static private func request<Query: GraphQLQuery>(query: Query) -> Publishers.ApolloFetch<Query> {
    API.client.fetchPublisher(query: query)
  }

  static func games() -> AnyPublisher<[Models.Game], Error> {
    request(query: GamesQuery())
      .map {
        let games: [[Models.Game]]? = $0.data?.pokemonV2Versiongroup.map {
          let pokedexes = $0.pokemonV2Pokedexversiongroups.compactMap { $0.pokemonV2Pokedex?.name }
          let games = $0.pokemonV2Versions.compactMap {
            Models.Game.init(name: $0.name, pokedexes: pokedexes)
          }
          return games
        }

        return (games ?? []).flatMap { $0 }
      }
      .eraseToAnyPublisher()
  }

  static func pokedexes(game: String) -> AnyPublisher<[String], Error> {
    request(query: PokedexesQuery(game: game))
      .map {
        $0.data?.pokemonV2Pokedex.map { $0.name } ?? []
      }
      .eraseToAnyPublisher()
  }

  static func pokemonEntries(_ pokedex: String) -> AnyPublisher<[Models.PokemonEntry], Error> {
    request(query: PokedexQuery(name: pokedex))
      .map {
        $0.data?.pokemonV2Pokedex.first?.pokemonV2Pokemondexnumbers.map {
          let name = $0.pokemonV2Pokemonspecy?.name ?? ""
          let number = $0.pokedexNumber
          let pokemon = $0.pokemonV2Pokemonspecy?.pokemonV2Pokemons.first
          let types  = pokemon?.pokemonV2Pokemontypes.map { $0.pokemonV2Type?.name }.compactMap { $0 } ?? []
          return .init(name: name, number: number, types: types)
        } ?? []
      }
      .eraseToAnyPublisher()
  }

  static func pokemonDetails(pokemon: String, game: String) ->
  AnyPublisher<Models.PokemonDetails, Error> {
    request(query: PokemonDetailsQuery(pokemon: pokemon, game: game, languageId: 9)).tryMap {
      let details = $0.data?.pokemonV2Pokemon.first
      let species = details?.pokemonV2Pokemonspecy
      let summary = species?
        .pokemonV2Pokemonspeciesnames
        .first?.genus
      let description = species?
        .pokemonV2Pokemonspeciesflavortexts
        .first?.flavorText
      let types = details?
        .pokemonV2Pokemontypes
        .compactMap { $0.pokemonV2Type?.name }
      let spritesData = details?.pokemonV2Pokemonsprites.first?.sprites.data(using: .utf8)
      let sprites = try JSONSerialization.jsonObject(with: spritesData ?? Data(),
                                                     options: .mutableContainers) as? [String: AnyObject]
      let abilities = details?.pokemonV2Pokemonabilities.map {
        Models.PokemonDetails.Ability(
          isHidden: $0.isHidden,
          name: $0
            .pokemonV2Ability?
            .name ?? "",
          text: $0
            .pokemonV2Ability?
            .pokemonV2Abilityflavortexts
            .first?.flavorText ?? "",
          effect: $0
            .pokemonV2Ability?
            .pokemonV2Abilityeffecttexts
            .first?.effect ?? "")
      }
      let stats = details?.pokemonV2Pokemonstats.map {
        Models.PokemonDetails.Stat(
          effort: $0.effort,
          base: $0.baseStat,
          name: $0.pokemonV2Stat?.name ?? "")
      }
      return Models.PokemonDetails(
        baseExperience: details?.baseExperience ?? 0,
        height: details?.height ?? 0,
        weight: details?.weight ?? 0,
        summary: summary ?? "",
        description: description ?? "",
        types: types  ?? [],
        sprites: sprites ?? [:],
        abilities: abilities ?? [],
        stats: stats ?? [])
    }
    .eraseToAnyPublisher()
  }

  static func pokemonMoves(pokemon: String, game: String) -> AnyPublisher<[Models.Move], Error> {
    request(query: PokemonMovesQuery(pokemon: pokemon, game: game)).tryMap {
      $0.data?.pokemonV2Pokemonmove.map {
        let id = $0.id
        let name = $0.pokemonV2Move?.name ?? ""
        let type = $0.pokemonV2Move?.pokemonV2Type?.name ?? ""
        let damageClass = $0.pokemonV2Move?.pokemonV2Movedamageclass?.name ?? ""
        let learnMethod = $0.pokemonV2Movelearnmethod?.name ?? ""
        let item = $0.pokemonV2Move?.pokemonV2Machines.first?.pokemonV2Item?.name
        let power = $0.pokemonV2Move?.power
        let level = $0.level
        return Models.Move(
          id: id,
          name: name,
          type: type,
          damageClass: damageClass,
          learnMethod: learnMethod,
          item: item,
          power: power,
          level: level)
      } ?? []
    }
    .eraseToAnyPublisher()
  }
}
