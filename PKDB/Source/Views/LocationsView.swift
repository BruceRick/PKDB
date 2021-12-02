//
//  LocationsView.swift
//  PKDB
//
//  Created by Bruce Rick on 2021-12-01.
//

import SwiftUI
import Combine

struct LocationsView: View {
  var pokemon: String
  var game: String

  var body: some View {
    APIContentView(request: locations) { locations in
      List(locations, id: \.id) { location in
        cell(location)
      }
      .navigationTitle("\(pokemon.capitalized) Locations")
    }
  }

  func cell(_ location: Models.Location) -> some View {
    HStack(spacing: 5) {
      Text(location.name)
        .fontWeight(.bold)
        .padding(10)
        .background(Color(.systemGray4))
        .clipShape(Capsule())
        .padding(.trailing, 10)
      VStack(alignment: .leading, spacing: 5) {
        Text(location.encounterMethod.capitalized.replacingOccurrences(of: "-", with: " "))
          .fontWeight(.bold)
        Text("Rarity: \(location.rarity)")
      }
      Spacer()
      Text("LV \(location.minLevel)-\(location.maxLevel)")
        .fontWeight(.bold)
        .padding(10)
        .background(Color(.systemGray4))
        .clipShape(Capsule())
    }
    .padding(.vertical, 10)
  }
}

extension LocationsView {
  func locations() -> AnyPublisher<[Models.Location], Error> {
    API.pokemonLocations(pokemon: pokemon, game: game)
  }
}
