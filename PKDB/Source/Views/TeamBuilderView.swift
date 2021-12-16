//
//  TeamBuilderView.swift
//  TeamBuilderView
//
//  Created by Bruce Rick on 2021-12-13.
//

import SwiftUI
import Combine

struct TeamBuilderView: View {
  var game: String
  var pokedex: String
  @State private var teams: [Models.Team] = []

  var body: some View {
    content
      .navigationBarTitle("Teams")
      .toolbar { addButton }
      .onAppear(perform: fetchTeams)
  }

  @ViewBuilder
  var content: some View {
    teamsList
      .overlay(teams.count == 0 ? noResults : nil)
  }

  var teamsList: some View {
    List {
      ForEach(teams, id: \.id) { team in
        Section {
          NavigationLink(destination: TeamView(team: team, game: game, pokedex: pokedex, save: saveTeam)) {
            Text(team.name)
          }
          ForEach(team.pokemon, id: \.name) { pokemon in
            NavigationLink(destination: PokemonDetailsView(pokemonName: pokemon.name, game: game)) {
              HStack {
                pokemonImageView(id: pokemon.id)
                Text(pokemon.name.capitalized)
                Spacer()
                ForEach(pokemon.types, id: \.self) {
                  TypeIconView(type: $0, height: 10, width: 10)
                    .padding(.vertical, 5)
                }
              }
            }
          }
        }
      }
      .onDelete(perform: deleteTeam)
    }
  }

  func pokemonImageView(id: Int) -> some View {
    APIContentView(request: { API.pokemonSprite(id: id) }) { data in
      Image(uiImage: UIImage(data: data) ?? UIImage())
        .resizable()
        .frame(width: 30, height: 30)
    }
  }

  var noResults: some View {
    VStack {
      Spacer()
      Text("No Teams for Pokemon \(game.capitalized)")
      Spacer()
    }
  }

  var addButton: some View {
    NavigationLink(destination: TeamView(team: emptyTeam, game: game, pokedex: pokedex, save: saveTeam)) {
      Image(systemName: "plus")
    }
  }

  var emptyTeam: Models.Team {
    .init(id: UUID().uuidString.hash, name: "", game: game, pokemon: [])
  }

  func saveTeam(team: Models.Team) {
    var storedTeams: [Models.Team] = Storage.get(.Teams) ?? []
    storedTeams.removeAll { $0.id == team.id }
    storedTeams.append(team)
    Storage.set(storedTeams, key: .Teams)
  }

  func deleteTeam(offsets: IndexSet) {
    guard var storedTeams: [Models.Team] = Storage.get(.Teams) else {
      return
    }

    let idsToDelete = offsets.map { teams[$0].id }
    storedTeams.removeAll { idsToDelete.contains($0.id) }
    Storage.set(storedTeams, key: .Teams)
    fetchTeams()
  }

  private func fetchTeams() {
    guard let storedTeams: [Models.Team] = Storage.get(.Teams) else {
      return
    }

    teams = storedTeams.filter { $0.game == game }
  }
}
