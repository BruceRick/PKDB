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
  @State private var showDetails = false
  var pokedex: String
  var game: String

  var entryFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.minimumIntegerDigits = 3
    return formatter
  }()

  var body: some View {
    APIContentView(request: entries) { entries in
      List(filteredPokemon(entries: entries), id: \.number) { pokemon in
        NavigationLink(destination: PokemonDetailsView(pokemonName: pokemon.name, game: game)) {
          summary(pokemon)
        }
        if showDetails {
          stats(pokemon)
        }
      }
      .searchableSafe(text: $searchText)
      .navigationTitle(pokedex.capitalized)
      .toolbar {
        Button {
          showDetails.toggle()
        } label: {
          Image(systemName: showDetails ? "info.circle.fill" : "info.circle")
        }
      }
    }
  }

  func summary(_ pokemon: Models.PokemonEntry) -> some View {
    HStack {
      Text((formattedEntryNumber(pokemon)))
        .padding(.trailing, 5)
      pokemonImageView(id: pokemon.id)
      Text(pokemon.name.capitalized)
      Spacer()
      ForEach(pokemon.types, id: \.self) {
        TypeIconView(type: $0, height: 10, width: 10)
          .padding(.vertical, 5)
      }
    }
  }

  func pokemonImageView(id: Int) -> some View {
    APIContentView(request: { API.pokemonSprite(id: id) }) { data in
      Image(uiImage: UIImage(data: data) ?? UIImage())
        .resizable()
        .frame(width: 30, height: 30)
    }
  }

  @ViewBuilder
  func stats(_ pokemon: Models.PokemonEntry) -> some View {
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
