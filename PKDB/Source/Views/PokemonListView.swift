//
//  PokemonListView.swift
//  PKDB
//
//  Created by Bruce Rick on 2021-06-18.
//

import SwiftUI
import Combine

struct PokemonListView: View {
  @State private var searchText = ""
  var pokedex: String
  var game: String

  var entryFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.minimumIntegerDigits = 3
    return formatter
  }()

  var body: some View {
    APIContentView(request: entries) { entries in
      List(filteredPokemon(entries: entries), id: \.number) { item in
        cell(item)
      }
      .searchableSafe(text: $searchText)
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

  func filteredPokemon(entries: [Models.PokemonEntry]) -> [Models.PokemonEntry] {
    guard !searchText.isEmpty else {
      return entries
    }

    return entries.filter { $0.name.lowercased().contains(searchText.lowercased()) }
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
