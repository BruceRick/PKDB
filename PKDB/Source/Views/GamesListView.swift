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
  @Environment(\.colorScheme) var colorScheme

  var body: some View {
    APIContentView(request: API.games) { games in
      List(games, id: \.name) { game in
        Button { didSelect(game) } label: {
          HStack {
            Text(game.name.capitalized)
              .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
            if selected.name == game.name {
              Spacer()
              Image(systemName: "checkmark")
            }
          }
        }
      }
    }
  }

  func didSelect(_ game: Models.Game) {
    selected = game
    presentationMode.wrappedValue.dismiss()
  }
}
