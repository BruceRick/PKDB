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
  @Environment(\.colorScheme) var colorScheme

  var body: some View {
    APIContentView(request: pokedexes) { pokedexes in
      List(pokedexes, id: \.self) { pokedex in
        Button { didSelect(pokedex) } label: {
          HStack {
            Text(pokedex.capitalized)
              .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
            if selected == pokedex {
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
  func pokedexes() -> AnyPublisher<[String], Error> {
    API.pokedexes(game: game)
  }
}
