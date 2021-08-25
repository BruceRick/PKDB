//
//  PokedexListView.swift
//  Pokedex
//
//  Created by Bruce Rick on 2021-04-05.
//

import SwiftUI
import Combine
import Apollo
import ApolloCombine

struct PokedexListView: View {
  var body: some View {
    APIContentView(request: API.pokedexes) { pokedexes in
      List(listItems(pokedexes)) { pokedex in
        NavigationLink(destination: PokemonListView(pokedex: pokedex.name)) {
          Text(pokedex.name)
        }
      }
    }
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
}
