//
//  PokemonDetailsView.swift
//  PKDB
//
//  Created by Bruce Rick on 2021-08-25.
//

import Foundation

import SwiftUI
import Combine

struct PokemonDetailsView: View {
  let pokemonName: String
  let game: String

  @State private var imageLoader = ImageLoader(urlString: "")
  @State private var pokemonImage: UIImage? = UIImage()

  @ViewBuilder var body: some View {
    APIContentView(request: details) { details in
      content(pokemon: details)
        .navigationTitle(pokemonName.capitalized)
        .onReceive(imageLoader.didChange, perform: imageLoaded)
    }
  }

  func content(pokemon: Models.PokemonDetails?) -> some View {
    List {
      pokemonSprite
      if let pokemon = pokemon {
        types(pokemon.types)
        entry(pokemon)
        abilities(pokemon)
        baseInfo(pokemon)
      }
    }
  }

  @ViewBuilder
  var pokemonImageView: some View {
    switch pokemonImage {
    case let image? where image != UIImage():
      Image(uiImage: image)
        .resizable()
    default:
      Image(systemName: "exclamationmark.circle")
        .foregroundColor(.red)
        .font(.system(size: 30))
    }
  }

  var pokemonSprite: some View {
    HStack {
      Spacer()
      pokemonImageView
        .frame(width: 200, height: 200)
        .loading(pokemonImage == nil)
        .padding(.top, 20)
      Spacer()
    }
  }

  func types(_ types: [String]) -> some View {
    Section(header: Text("Type")) {
      // NavigationLink(destination: DamageRelationsView(types: types)) {
        HStack(spacing: 20) {
          ForEach(types.identifiable) { type in
            TypeIconView(type: type.value, text: true)
          }
        }
        .padding([.vertical, .trailing], 10)
      // }
    }
  }

  func entry(_ pokemon: Models.PokemonDetails) -> some View {
    Section(header: Text("Entry")) {
      VStack(alignment: .leading, spacing: 10) {
        Text(pokemon.summary)
          .font(.system(.title2))
          .fontWeight(.bold)
        Text(pokemon.description.replacingOccurrences(of: "\n", with: " "))
      }
      .padding(.vertical, 10)
    }
  }

  func abilities(_ pokemon: Models.PokemonDetails) -> some View {
    Section(header: Text("Abilities")) {
      ForEach(pokemon.abilities.map { AbilityListItem(ability: $0) }) { item in
        VStack(alignment: .leading, spacing: 10) {
          HStack {
            Text(item.ability.name.capitalized)
              .font(.system(.title2))
              .fontWeight(.bold)
            if item.ability.isHidden {
              Text("HIDDEN")
                .foregroundColor(.red)
                .fontWeight(.bold)
            }
          }
          Text(item.ability.effect)
        }
        .padding(.vertical, 10)
      }
    }
  }

  func baseInfo(_ pokemon: Models.PokemonDetails) -> some View {
    Section(header: Text("Base Info")) {
      HStack {
        Text("Base Experience:")
        Spacer()
        Text("\(pokemon.baseExperience)")
      }
      HStack {
        Text("Height:")
        Spacer()
        Text("\(pokemon.height)")
      }
      HStack {
        Text("Width:")
        Spacer()
        Text("\(pokemon.weight)")
      }
    }
  }

  func imageLoaded(data: Data) {
    pokemonImage = UIImage(data: data) ?? UIImage()
  }
}

extension PokemonDetailsView {
  func details() -> AnyPublisher<Models.PokemonDetails?, Error> {
    API.pokemonDetails(pokemon: pokemonName, game: game)
  }

  struct AbilityListItem: Identifiable {
    var id: String {
      ability.name
    }
    var ability: Models.PokemonDetails.Ability
  }
}
