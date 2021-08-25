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

  var entryFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.minimumIntegerDigits = 3
    return formatter
  }()

  var body: some View {
    APIContentView(request: entries) { entries in
      List(listItems(entries)) { item in
        HStack {
          Text((formattedEntryNumber(item)))
            .padding(.trailing, 5)
          Text(item.pokemonEntry.name.capitalized)
          Spacer()
          ForEach(item.pokemonEntry.types.identifiable) {
            TypeIconView(type: $0.value)
          }
        }
      }
      .navigationTitle(pokedex.capitalized)
    }
  }
}

extension PokemonListView {
  func entries() -> AnyPublisher<[API.PokemonEntry]?, Error> {
    API.pokemonEntries(pokedex)
  }

  struct ListItem: Identifiable {
    var pokemonEntry: API.PokemonEntry
    var id: String { String(pokemonEntry.number) }
  }

  func listItems(_ entries: [API.PokemonEntry]?) -> [ListItem] {
    let entries = entries ?? []
    return entries.map(ListItem.init)
  }

  func formattedEntryNumber(_ item: ListItem) -> String {
    entryFormatter.string(from: NSNumber(value: item.pokemonEntry.number)) ?? "???"
  }
}
