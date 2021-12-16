//
//  EvolutionsView.swift
//  PKDB
//
//  Created by Bruce Rick on 2021-12-02.
//

import SwiftUI
import Combine

struct EvolutionsView: View {
  var pokemon: String
  var game: String

  var body: some View {
    APIContentView(request: evolutions) { evolution in
      List(evolution, id: \.id) { evolution in
        cell(evolution)
      }
      .navigationTitle("Evolutions")
    }
  }

  func cell(_ evolution: Models.Evolution) -> some View {
    NavigationLink(destination: PokemonDetailsView(pokemonName: evolution.pokemon, game: game)) {
      HStack(spacing: 20) {
        pokemonImageView(id: evolution.pokemonId)
        Text(evolution.pokemon.capitalized)
          .fontWeight(.bold)
          .padding(10)
          .background(Color(.systemGray4))
          .clipShape(Capsule())
          .padding(.trailing, 10)
        Spacer()
        rightList(evolution)
      }
      .padding(.vertical, 10)
    }
  }

  func pokemonImageView(id: Int) -> some View {
    APIContentView(request: { API.pokemonSprite(id: id) }) { data in
      Image(uiImage: UIImage(data: data) ?? UIImage())
        .resizable()
        .frame(width: 30, height: 30)
    }
  }

  func rightList(_ evolution: Models.Evolution) -> some View {
    VStack(alignment: .trailing, spacing: 5) {
      if let trigger = evolution.trigger {
        Text(trigger.capitalized)
          .fontWeight(.bold)
      }
      if let item = evolution.item {
        Text("Item - \(item.capitalized)")
      }
      if let location = evolution.location {
        Text("Location - \(location.capitalized)")
      }
      if let gender = evolution.gender {
        Text("Gender - \(gender.capitalized)")
      }
      if let timeOfDay = evolution.timeOfDay, timeOfDay != "" {
        Text("Time of Day - \(timeOfDay.capitalized)")
      }
      if let level = evolution.minLevel {
        Text("LV - \(level)")
      }
      if let happiness = evolution.minHappiness {
        Text("Happiness - \(happiness)")
      }
      if let beauty = evolution.minBeauty {
        Text("Beauty - \(beauty)")
      }
      if let affection = evolution.minAffection {
        Text("Affection - \(affection)")
      }
    }
  }
}

extension EvolutionsView {
  func evolutions() -> AnyPublisher<[Models.Evolution], Error> {
    API.pokemonEvolutions(pokemon: pokemon)
  }
}
