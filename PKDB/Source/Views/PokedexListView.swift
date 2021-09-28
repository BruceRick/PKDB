//
//  PokedexListView.swift
//  Pokedex
//
//  Created by Bruce Rick on 2021-04-05.
//

import SwiftUI
import Combine

struct PokedexListView: View {
  var game: String
  @Binding var selected: String
  @Environment(\.presentationMode) var presentationMode

  var body: some View {
    APIContentView(request: games) { pokedexes in
      List(listItems(pokedexes)) { pokedex in
        Button { didSelect(pokedex.name) } label: {
          HStack {
            Text(pokedex.name.capitalized)
            if selected == pokedex.name {
              Spacer()
              Image(systemName: "checkmark")
            }
          }
        }
      }
    }
  }

  func didSelect(_ pokedex: String) {
    selected = pokedex
    presentationMode.wrappedValue.dismiss()
  }
}

extension PokedexListView {
  struct ListItem: Identifiable {
    var name: String
    var id: String { name }
  }

  func listItems(_ pokedexes: [String]?) -> [ListItem] {
    let pokedexes = pokedexes ?? []
    return pokedexes.map(ListItem.init)
  }

  func games() -> AnyPublisher<[String]?, Error> {
    API.pokedexes(game: game)
  }
}
