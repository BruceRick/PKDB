//
//  ContentView.swift
//  Pokedex
//
//  Created by Bruce Rick on 2021-03-21.
//

import SwiftUI

struct MainView: View {
  @State var selectedGame = defaultGame
  @State var selectedPokedex = defaultGame.pokedexes.first ?? ""

  var body: some View {
    NavigationView {
      List {
        cell(text: "Game",
             iconName: "gamecontroller.fill",
             destination: GamesListView(selected: $selectedGame),
             selected: selectedGame.name)
        cell(text: "Pokedex",
             iconName: "book.fill",
             destination: PokedexListView(game: selectedGame.name, selected: $selectedPokedex),
             selected: selectedPokedex)
        cell(text: "Pokemon",
             iconName: "circle.grid.cross.fill",
             destination: PokemonListView(pokedex: selectedPokedex, game: selectedGame.name))
        cell(text: "Abilities",
             iconName: "leaf.fill",
             destination: EmptyView())
        cell(text: "Moves",
             iconName: "bolt.fill",
             destination: EmptyView())
        cell(text: "Items",
             iconName: "gift.fill",
             destination: EmptyView())
        cell(text: "Settings",
             iconName: "gearshape.fill",
             destination: EmptyView())
      }
      .navigationBarTitle(Text("Pokemon Database"))
    }
    .navigationViewStyle(StackNavigationViewStyle())
    .onChange(of: selectedGame, perform: { _ in didSetGame() })
  }

  static var defaultGame: Models.Game {
    Models.Game(name: "sword", pokedexes: ["galar"])
  }

  func didSetGame() {
    if let pokedex = selectedGame.pokedexes.first {
      selectedPokedex = pokedex
    }
  }
}

func cell<Destination: View>(text: String,
                             iconName: String,
                             destination: Destination,
                             selected: String? = nil) -> some View {
  NavigationLink(destination: destination.navigationTitle(text)) {
    HStack {
      Image(systemName: iconName)
        .font(.system(size: 22, weight: .regular))
        .frame(width: 30, height: 22)
        .padding(.horizontal, 5)
      Text(text)
      Spacer()
      Text(selected?.capitalized ?? "")
    }.frame(minHeight: 44)
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
