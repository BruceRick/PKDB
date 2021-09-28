//
//  GamesListView.swift
//  PKDB
//
//  Created by Bruce Rick on 2021-08-26.
//

import SwiftUI
import Combine
import Apollo
import ApolloCombine

struct GamesListView: View {
  @Binding var selected: Models.Game
  @Environment(\.presentationMode) var presentationMode

  var body: some View {
    APIContentView(request: API.games) { games in
      List(listItems(games)) { item in
        Button { didSelect(item.game) } label: {
          HStack {
            Text(item.game.name.capitalized)
            if selected.name == item.game.name {
              Spacer()
              Image(systemName: "checkmark")
            }
          }
        }.buttonStyle(.plain)
      }
    }
  }

  func didSelect(_ game: Models.Game) {
    selected = game
    presentationMode.wrappedValue.dismiss()
  }
}

extension GamesListView {
  struct ListItem: Identifiable {
    var game: Models.Game
    var id: String { game.name }
  }

  func listItems(_ games: [Models.Game]?) -> [ListItem] {
    let games = games ?? []
    return games.map(ListItem.init)
  }
}
