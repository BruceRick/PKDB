//
//  TeamView.swift
//  PKDB
//
//  Created by Bruce Rick on 2021-12-13.
//

import SwiftUI
import Combine

struct TeamView: View {
  @State var team: Models.Team
  var game: String
  var pokedex: String
  var save: (Models.Team) -> Void

  private let maxTeamSize = 6
  private let maxMoves = 4

  @State private var expandedStats: Models.Team.Pokemon?
  @State private var teamNameText = ""

  @Environment(\.presentationMode) var presentationMode

  var body: some View {
    List {
      Section {
        teamName
      }
      if team.pokemon.count < maxTeamSize {
        Section {
          addPokemon
        }
      }
      ForEach(team.pokemon, id: \.name) { pokemon in
        Section(header: Text(pokemon.name.capitalized).fontWeight(.bold) ) {
          pokemonDetails(pokemon: pokemon)
          ability(pokemon: pokemon)
          moves(pokemon: pokemon)
          stats(pokemon: pokemon)
        }
      }
      .onDelete(perform: deletePokemon)
    }
    .onChange(of: teamNameText) { name in team.name = name }
    .onAppear { teamNameText = team.name }
    .toolbar {
      Button {
        save(team)
        presentationMode.wrappedValue.dismiss()
      } label: {
        Text("Save")
      }.disabled(teamNameText.isEmpty)
    }
    .navigationTitle(teamNameText.isEmpty ? "New Team" : "Edit Team")
  }

  var teamName: some View {
    HStack {
      Text("Team Name: ")
      TextField("Team Name", text: $teamNameText)
    }
  }

  func pokemonDetails(pokemon: Models.Team.Pokemon) -> some View {
    NavigationLink(destination: PokemonDetailsView(pokemonName: pokemon.name, game: game)) {
      HStack {
        pokemonImageView(id: pokemon.id)
        Spacer()
        ForEach(pokemon.types, id: \.self) {
          TypeIconView(type: $0).padding(.vertical, 5)
        }
      }
    }
  }

  func pokemonImageView(id: Int) -> some View {
    APIContentView(request: { API.pokemonSprite(id: id) }) { data in
      Image(uiImage: UIImage(data: data) ?? UIImage())
        .resizable()
        .frame(width: 100, height: 100)
    }
  }

  @ViewBuilder
  func ability(pokemon: Models.Team.Pokemon) -> some View {
    if let ability = pokemon.ability {
      Text(ability.name.capitalized)
    } else {
      NavigationLink(destination: EmptyView()) {
        Text("Add Ability")
      }
    }
  }

  @ViewBuilder
  func moves(pokemon: Models.Team.Pokemon) -> some View {
    Text("Moves")
      .fontWeight(.bold)
    ForEach(pokemon.moves, id: \.name) { move in
      Text(move.name)
    }
    if pokemon.moves.count < maxMoves {
      NavigationLink(destination: EmptyView()) {
        Text("Add Move")
      }
    }
  }

  @ViewBuilder
  func stats(pokemon: Models.Team.Pokemon) -> some View {
    HStack {
      Text("Stats")
        .fontWeight(.bold)
      Button {
        withAnimation {
          expandedStats = expandedStats?.name == pokemon.name ? nil : pokemon
        }
      } label: {
        Image(systemName: expandedStats?.name == pokemon.name ? "info.circle.fill" : "info.circle")
      }
      Spacer()
      Text("\(pokemon.stats.map { $0.base }.reduce(0, +))")
    }
    if expandedStats?.name == pokemon.name {
      ForEach(pokemon.stats, id: \.name) { stat in
        HStack {
          Text(stat.name.capitalized)
            .padding(.leading, 10)
          Spacer()
          Text("\(stat.base)")
        }.transition(.move(edge: .bottom))
      }
    }
  }

  var addPokemon: some View {
    NavigationLink(destination: PokemonListView(pokedex: pokedex, game: game, onSelect: pokemonSelected)) {
      Text("Add Pokemon")
    }
  }

  func pokemonSelected(entry: Models.PokemonEntry) {
    let stats = entry.stats.map { Models.Team.Pokemon.Stat(base: $0.base, name: $0.name) }
    let pokemon = Models.Team.Pokemon(id: entry.id,
                                      pokedex: pokedex,
                                      name: entry.name,
                                      types: entry.types,
                                      stats: stats)
    team.pokemon.append(pokemon)
  }

  func deletePokemon(indexSet: IndexSet) {
    team.pokemon.remove(atOffsets: indexSet)
  }
}
