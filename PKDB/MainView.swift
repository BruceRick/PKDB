//
//  ContentView.swift
//  Pokedex
//
//  Created by Bruce Rick on 2021-03-21.
//

import SwiftUI

struct MainView: View {
  @State var selectedGame = Storage.get(.Game) ?? defaultGame
  @State var selectedPokedex = Storage.get(.Pokedex) ?? defaultGame.pokedexes.first ?? ""

  var body: some View {
    NavigationView {
      List {
        cell(text: "Game",
             iconName: "gamecontroller.fill",
             destination: GamesListView(selected: $selectedGame),
             rightText: selectedGame.name)
        cell(text: "Pokedex",
             iconName: "book.fill",
             destination: PokedexListView(game: selectedGame.name, selected: $selectedPokedex),
             rightText: selectedPokedex)
        cell(text: "Pokemon",
             iconName: "list.and.film",
             destination: PokemonListView(pokedex: selectedPokedex, game: selectedGame.name))
        cell(text: "Types",
             iconName: "leaf.fill",
             destination: TypesView())
        cell(text: "Abilities",
             iconName: "hammer.fill",
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
    .onChange(of: selectedGame, perform: didSetGame)
    .onChange(of: selectedPokedex, perform: didSetPokedex)
  }

  static var defaultGame: Models.Game {
    Models.Game(name: "sword", pokedexes: ["galar"])
  }

  func didSetGame(_ game: Models.Game) {
    Storage.set(game, key: .Game)
    if let pokedex = game.pokedexes.first {
      selectedPokedex = pokedex
      Storage.set(pokedex, key: .Pokedex)
    }
  }

  func didSetPokedex(_ pokedex: String) {
    Storage.set(pokedex, key: .Pokedex)
  }
}

func cell<Destination: View>(text: String,
                             iconName: String,
                             destination: Destination,
                             rightText: String? = nil) -> some View {
  NavigationLink(destination: destination.navigationTitle(text)) {
    HStack {
      Image(systemName: iconName)
        .font(.system(size: 22, weight: .regular))
        .frame(width: 30, height: 22)
        .padding(.horizontal, 5)
      Text(text)
      Spacer()
      Text(rightText?.capitalized ?? "")
    }.frame(minHeight: 44)
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
