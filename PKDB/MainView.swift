//
//  ContentView.swift
//  Pokedex
//
//  Created by Bruce Rick on 2021-03-21.
//

import SwiftUI

struct MainView: View {
  @State var selectedGame = defaultGame { didSet { didSetGame() } }
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
      }
      .navigationBarTitle(Text("Pokemon Database"))
    }.navigationViewStyle(StackNavigationViewStyle())
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
