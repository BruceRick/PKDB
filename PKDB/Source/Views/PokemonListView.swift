//
//  PokemonListView.swift
//  PKDB
//
//  Created by Bruce Rick on 2021-06-18.
//

import SwiftUI
import Combine

struct PokemonListView: View {
  var pokedex: String
  var game: String

  var entryFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.minimumIntegerDigits = 3
    return formatter
  }()

  var body: some View {
    APIContentView(request: entries) { entries in
      List(entries, id: \.number) { item in
        cell(item)
      }
      .navigationTitle(pokedex.capitalized)
    }
  }

  func cell(_ pokemon: Models.PokemonEntry) -> some View {
    NavigationLink(destination: PokemonDetailsView(pokemonName: pokemon.name, game: game)) {
      HStack {
        Text((formattedEntryNumber(pokemon)))
          .padding(.trailing, 5)
        Text(pokemon.name.capitalized)
        Spacer()
        ForEach(pokemon.types, id: \.self) {
          TypeIconView(type: $0)
        }
      }
    }
  }
}

extension PokemonListView {
  func entries() -> AnyPublisher<[Models.PokemonEntry], Error> {
    API.pokemonEntries(pokedex)
  }

  func formattedEntryNumber(_ pokemon: Models.PokemonEntry) -> String {
    entryFormatter.string(from: NSNumber(value: pokemon.number)) ?? "???"
  }
}
