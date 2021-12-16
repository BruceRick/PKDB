//
//  PokemonDetailsView.swift
//  PKDB
//
//  Created by Bruce Rick on 2021-08-25.
//

import Foundation

import SwiftUI
import Combine

struct PokemonDetailsView: View {
  let pokemonName: String
  let game: String

  @ViewBuilder var body: some View {
    APIContentView(request: details) { details in
      content(pokemon: details)
    }
    .navigationTitle(pokemonName.capitalized)
  }

  func content(pokemon: Models.PokemonDetails?) -> some View {
    List {
      if let pokemon = pokemon {
        pokemonImageView(id: pokemon.id)
        types(pokemon.types)
        entry(pokemon)
        abilities(pokemon)
        stats(pokemon)
        evYield(pokemon)
        baseInfo(pokemon)
      }
    }
  }

  func pokemonImageView(id: Int) -> some View {
    APIContentView(request: { API.pokemonSprite(id: id) }) { data in
      HStack {
        Spacer()
        Image(uiImage: UIImage(data: data) ?? UIImage())
          .resizable()
          .frame(width: 200, height: 200)
          .padding(.top, 20)
        Spacer()
      }
    }
  }

  func types(_ types: [String]) -> some View {
    Section(header: Text("Type")) {
      NavigationLink(destination: TypesView(selectedTypes: types)) {
        HStack(spacing: 20) {
          ForEach(types, id: \.self) {
            TypeIconView(type: $0, text: true)
          }
        }
        .padding([.vertical, .trailing], 10)
      }
    }
  }

  func entry(_ pokemon: Models.PokemonDetails) -> some View {
    Section(header: Text("Entry")) {
      VStack(alignment: .leading, spacing: 10) {
        Text(pokemon.summary)
          .font(.system(.title2))
          .fontWeight(.bold)
        Text(pokemon.description.replacingOccurrences(of: "\n", with: " "))
      }
      .padding(.vertical, 10)
    }
  }

  func abilities(_ pokemon: Models.PokemonDetails) -> some View {
    Section(header: Text("Abilities")) {
      ForEach(pokemon.abilities, id: \.name) { ability in
        VStack(alignment: .leading, spacing: 10) {
          HStack {
            Text(ability.name.capitalized)
              .font(.system(.title2))
              .fontWeight(.bold)
            if ability.isHidden {
              Text("HIDDEN")
                .foregroundColor(.red)
                .fontWeight(.bold)
            }
          }
          if !ability.text.isEmpty {
            Text(ability.text)
          }
          if !ability.effect.isEmpty {
            Text(ability.effect)
          }
        }
        .padding(.vertical, 10)
      }
    }
  }

  func stats(_ pokemon: Models.PokemonDetails) -> some View {
    Section(header: Text("Stats")) {
      ForEach(pokemon.stats, id: \.name) { stat in
        HStack {
          Text(stat.name.capitalized)
          Spacer()
          Text("\(stat.base)")
        }
      }
      HStack {
        Text("Total")
        Spacer()
        Text("\(pokemon.stats.map { $0.base }.reduce(0, +))")
      }
    }
  }

  func evYield(_ pokemon: Models.PokemonDetails) -> some View {
    Section(header: Text("EV Yield")) {
      ForEach(pokemon.stats.filter { $0.effort > 0 }, id: \.name) { stat in
        HStack {
          Text(stat.name.capitalized)
          Spacer()
          Text("\(stat.effort)")
        }
      }
    }
  }

  func baseInfo(_ pokemon: Models.PokemonDetails) -> some View {
    Section(header: Text("Other Info")) {
      NavigationLink(destination: EvolutionsView(pokemon: pokemonName, game: game)) {
        Text("Evolutions")
      }
      NavigationLink(destination: MovesView(pokemon: pokemonName, game: game)) {
        Text("Moves")
      }
      NavigationLink(destination: LocationsView(pokemon: pokemonName, game: game)) {
        Text("Locations")
      }
      HStack {
        Text("Base Experience:")
        Spacer()
        Text("\(pokemon.baseExperience)")
      }
      HStack {
        Text("Height:")
        Spacer()
        Text("\(pokemon.height)")
      }
      HStack {
        Text("Width:")
        Spacer()
        Text("\(pokemon.weight)")
      }
    }
  }
}

extension PokemonDetailsView {
  func details() -> AnyPublisher<Models.PokemonDetails, Error> {
    API.pokemonDetails(pokemon: pokemonName, game: game)
  }
}
