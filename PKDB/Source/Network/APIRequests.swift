//
//  NetworkRequests.swift
//  PKDB
//
//  Created by Bruce Rick on 2021-08-25.
//

import Foundation
import Combine
import Apollo
import ApolloAPI
import PokeAPI

extension API {
  static private func request<Query: GraphQLQuery>(query: Query) -> Publishers.ApolloFetch<Query> {
    API.client.fetchPublisher(query: query)
  }

  static func games() -> AnyPublisher<[Models.Game], Error> {
    request(query: GamesQuery())
      .map {
        let games: [[Models.Game]]? = $0.data?.pokemon_v2_versiongroup.map {
            let pokedexes = $0.pokemon_v2_pokedexversiongroups.compactMap { $0.pokemon_v2_pokedex?.name }
          let games = $0.pokemon_v2_versions.compactMap {
            Models.Game.init(name: $0.name, pokedexes: pokedexes)
          }
          return games
        }
        return (games ?? []).flatMap { $0 }
      }
      .eraseToAnyPublisher()
  }

  static func pokedexes(game: String) -> AnyPublisher<[String], Error> {
      request(query: PokedexesQuery(game: .some(game)))
      .map {
        $0.data?.pokemon_v2_pokedex.map { $0.name } ?? []
      }
      .eraseToAnyPublisher()
  }

  static func pokemonEntries(_ pokedex: String) -> AnyPublisher<[Models.PokemonEntry], Error> {
    request(query: PokedexQuery(name: .some(pokedex)))
      .map {
        $0.data?.pokemon_v2_pokedex.first?.pokemon_v2_pokemondexnumbers.map {
          let id = $0.pokemon_v2_pokemonspecy?.id ?? 0
          let name = $0.pokemon_v2_pokemonspecy?.name ?? ""
          let number = $0.pokedex_number
          let pokemon = $0.pokemon_v2_pokemonspecy?.pokemon_v2_pokemons.first
          let types  = pokemon?.pokemon_v2_pokemontypes.map { $0.pokemon_v2_type?.name }.compactMap { $0 } ?? []
          let stats = pokemon?.pokemon_v2_pokemonstats.map {
            Models.PokemonEntry.Stat(
              effort: $0.effort,
              base: $0.base_stat,
              name: $0.pokemon_v2_stat?.name ?? "")
          } ?? []
          return .init(id: id, name: name, number: number, types: types, stats: stats)
        } ?? []
      }
      .eraseToAnyPublisher()
  }

  // swiftlint:disable:next function_body_length
  static func pokemonDetails(pokemon: String, game: String) -> AnyPublisher<Models.PokemonDetails, Error> {
    request(query: PokemonDetailsQuery(pokemon: .some(pokemon), game: .some(game), languageId: .some(9))).tryMap {
      let details = $0.data?.pokemon_v2_pokemon.first
      let species = details?.pokemon_v2_pokemonspecy
      let summary = species?
        .pokemon_v2_pokemonspeciesnames
        .first?.genus
      let description = species?
        .pokemon_v2_pokemonspeciesflavortexts
        .first?.flavor_text
      let types = details?
        .pokemon_v2_pokemontypes
        .compactMap { $0.pokemon_v2_type?.name }
      let spritesData = details?.pokemon_v2_pokemonsprites.first?.sprites.data(using: .utf8)
      let sprites = try JSONSerialization.jsonObject(with: spritesData ?? Data(),
                                                     options: .mutableContainers) as? [String: AnyObject]
      let abilities = details?.pokemon_v2_pokemonabilities.map {
        Models.PokemonDetails.Ability(
          isHidden: $0.is_hidden,
          name: $0
            .pokemon_v2_ability?
            .name ?? "",
          text: $0
            .pokemon_v2_ability?
            .pokemon_v2_abilityflavortexts
            .first?.flavor_text ?? "",
          effect: $0
            .pokemon_v2_ability?
            .pokemon_v2_abilityeffecttexts
            .first?.effect ?? "")
      }
      let stats = details?.pokemon_v2_pokemonstats.map {
        Models.PokemonDetails.Stat(
          effort: $0.effort,
          base: $0.base_stat,
          name: $0.pokemon_v2_stat?.name ?? "")
      }
      return Models.PokemonDetails(
        id: details?.id ?? 0,
        baseExperience: details?.base_experience ?? 0,
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
    request(query: PokemonMovesQuery(pokemon: .some(pokemon), game: .some(game))).tryMap {
      $0.data?.pokemon_v2_pokemonmove.map {
        let id = $0.id
        let name = $0.pokemon_v2_move?.name ?? ""
        let type = $0.pokemon_v2_move?.pokemon_v2_type?.name ?? ""
        let damageClass = $0.pokemon_v2_move?.pokemon_v2_movedamageclass?.name ?? ""
        let learnMethod = $0.pokemon_v2_movelearnmethod?.name ?? ""
        let item = $0.pokemon_v2_move?.pokemon_v2_machines.first?.pokemon_v2_item?.name
        let power = $0.pokemon_v2_move?.power
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

  static func pokemonLocations(pokemon: String, game: String) -> AnyPublisher<[Models.Location], Error> {
    request(query: PokemonLocationsQuery(pokemon: .some(pokemon), game: .some(game), languageId: .some(9))).tryMap {
      $0.data?.pokemon_v2_pokemon.first?.pokemon_v2_encounters.map {
       Models.Location(
          id: $0.id,
          minLevel: $0.min_level,
          maxLevel: $0.max_level,
          encounterMethod: $0.pokemon_v2_encounterslot?.pokemon_v2_encountermethod?.name ?? "",
          rarity: $0.pokemon_v2_encounterslot?.rarity ?? 0,
          name: $0.pokemon_v2_locationarea?.pokemon_v2_location?.pokemon_v2_locationnames.first?.name ?? "")
      } ?? []
    }
    .eraseToAnyPublisher()
  }

  static func pokemonEvolutions(pokemon: String) -> AnyPublisher<[Models.Evolution], Error> {
    request(query: PokemonEvolutionsQuery(pokemon: .some(pokemon))).tryMap {
      let evolutions =
      $0.data?.pokemon_v2_evolutionchain.first?.pokemon_v2_pokemonspecies.map { pokemon -> [Models.Evolution] in
        guard pokemon.pokemon_v2_pokemonevolutions.count > 0 else {
          return [Models.Evolution(
            id: UUID().uuidString.hash,
            pokemonId: pokemon.id,
            pokemon: pokemon.name,
            trigger: nil,
            item: nil,
            location: nil,
            gender: nil,
            timeOfDay: nil,
            minLevel: nil,
            minHappiness: nil,
            minBeauty: nil,
            minAffection: nil)]
        }
        return pokemon.pokemon_v2_pokemonevolutions.map { evolution in
          Models.Evolution(
            id: evolution.id,
            pokemonId: pokemon.id,
            pokemon: pokemon.name,
            trigger: evolution.pokemon_v2_evolutiontrigger?.name,
            item: evolution.pokemon_v2_item?.name ?? evolution.pokemonV2ItemByHeldItemId?.name,
            location: evolution.pokemon_v2_location?.name,
            gender: evolution.pokemon_v2_gender?.name,
            timeOfDay: evolution.time_of_day,
            minLevel: evolution.min_level,
            minHappiness: evolution.min_happiness,
            minBeauty: evolution.min_beauty,
            minAffection: evolution.min_affection)
        }
      }

      return (evolutions ?? []).flatMap { $0 }
    }
    .eraseToAnyPublisher()
  }

  static func pokemonTypes() -> AnyPublisher<Models.PokemonTypes, Error> {
    request(query: PokemonTypesQuery()).tryMap {
      Models.PokemonTypes(all: $0.data?.pokemon_v2_type.map {
        return Models.PokemonTypes.PokemonType(
          name: $0.name,
          efficiencies: $0.pokemon_v2_typeefficacies.map {
            Models.PokemonTypes.Efficiency(
              name: $0.pokemonV2TypeByTargetTypeId?.name ?? "UNKNOWN",
              factor: $0.damage_factor
            )
          })
      } ?? [])
    }
    .eraseToAnyPublisher()
  }

  public enum ImageError: Error {
    case invalidURL

    public var errorDescription: String? {
      switch self {
      case .invalidURL:
        return "Invalid image url"
      }
    }
  }

  static func pokemonSprite(id: Int) -> AnyPublisher<Data, Error> {
    if let storedData = Storage.getSpriteData(pokemonId: id) {
      return Just(storedData)
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
    }
    return downloadPokemonSprite(id: id)
  }

  private static func downloadPokemonSprite(id: Int) -> AnyPublisher<Data, Error> {
    let urlString = "\(API.imageURLString)\(id).png"
    guard let url = URL(string: urlString) else {
      return Fail<Data, Error>(error: ImageError.invalidURL).eraseToAnyPublisher()
    }
    return URLSession.shared.dataTaskPublisher(for: url)
      .tryMap {
        Storage.setSpriteData(pokemonId: id, data: $0.data)
        return $0.data
      }
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }
}
