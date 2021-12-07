//
//  TypesView.swift
//  PKDB
//
//  Created by Bruce Rick on 2021-12-02.
//

import SwiftUI
import Combine

struct TypesView: View {
  var selectedTypes: [String] = []
  @State private var expandedType = ""

  var body: some View {
    APIContentView(request: API.pokemonTypes) { types in
      List(types.all.filtered(types: selectedTypes), id: \.name) { type in
        cell(type, efficiencies: types.efficiencies(typeName: type.name))
      }
      .navigationTitle("Types")
    }
  }

  func cell(_ type: Models.PokemonTypes.PokemonType,
            efficiencies: (strengths: [Models.PokemonTypes.Efficiency],
                           weaknesses: [Models.PokemonTypes.Efficiency])) -> some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack(spacing: 5) {
        TypeIconView(type: type.name, text: true)
        Spacer()
        Button(expandedType == type.name ? "Collapse" : "Expand") {
          expandedType = expandedType == type.name ? "" : type.name
        }
      }
      if expandedType == type.name {
        efficienciesList(efficiencies)
      }
    }.padding(.vertical, 10)
  }

  @ViewBuilder func efficienciesList(_ efficiencies: (
                                        strengths: [Models.PokemonTypes.Efficiency],
                                       weaknesses: [Models.PokemonTypes.Efficiency])) -> some View {
    Divider()
      .padding(.top, 10)
    Text("Strengths")
      .foregroundColor(.green)
      .fontWeight(.bold)
      .padding(.vertical, 10)
    Divider()
    ForEach(efficiencies.strengths.groupedByFactor().sorted(by: { $0.key > $1.key }), id: \.key) { factor, types in
      VStack(alignment: .leading, spacing: 10) {
        Text(strengthText(factor: factor))
          .fontWeight(.bold)
        typeRows(types.rows())
      }
    }
    Divider()
    Text("Weaknesses")
      .foregroundColor(.red)
      .fontWeight(.bold)
      .padding(.vertical, 10)
    Divider()
    ForEach(efficiencies.weaknesses.groupedByFactor().sorted(by: { $0.key > $1.key }), id: \.key) { factor, types in
      VStack(alignment: .leading, spacing: 10) {
        Text(weaknessText(factor: factor))
          .fontWeight(.bold)
        typeRows(types.rows())
      }
    }
  }

  @ViewBuilder func typeRows(_ rows: (
    row1: [Models.PokemonTypes.Efficiency],
    row2: [Models.PokemonTypes.Efficiency],
    row3: [Models.PokemonTypes.Efficiency])
  ) -> some View {
    HStack(spacing: 10) {
      ForEach(rows.row1, id: \.name) { type in
        TypeIconView(type: type.name)
      }
    }
    HStack(spacing: 10) {
      ForEach(rows.row2, id: \.name) { type in
        TypeIconView(type: type.name)
      }
    }
    HStack(spacing: 10) {
      ForEach(rows.row3, id: \.name) { type in
        TypeIconView(type: type.name)
      }
    }
  }

  func strengthText(factor: Int) -> String {
    if factor > 100 {
      return "\(factor)% Damage Against:"
    } else {
      return "\(factor)% Damage From:"
    }
  }

  func weaknessText(factor: Int) -> String {
    if factor > 100 {
      return "\(factor)% Damage From:"
    } else {
      return "\(factor)% Damage Against:"
    }
  }
}

// strengths double damage to +200% / -50% damage from / -0% damage from
// weaknesses double damage from -200% / half damage to / no damage to
private extension Models.PokemonTypes {
  func efficiencies(typeName: String) -> (strengths: [Models.PokemonTypes.Efficiency],
                                          weaknesses: [Models.PokemonTypes.Efficiency]) {
    guard let type = all.first(where: { $0.name == typeName }) else {
      return ([], [])
    }

    var strengths: [Models.PokemonTypes.Efficiency] = []
    var weaknesses: [Models.PokemonTypes.Efficiency] = []

    strengths.append(contentsOf: type.efficiencies.filter { $0.factor > 100 })
    weaknesses.append(contentsOf: type.efficiencies.filter { $0.factor < 100 })

    let relatedStrengths = all.map { type in type.efficiencies
        .filter { $0.name == typeName && $0.factor < 100 }
        .map { Models.PokemonTypes.Efficiency(name: type.name, factor: $0.factor) } }
        .flatMap { $0 }
    let relatedWeaknesses = all.map { type in type.efficiencies
        .filter { $0.name == typeName && $0.factor > 100 }
        .map { Models.PokemonTypes.Efficiency(name: type.name, factor: $0.factor) } }
        .flatMap { $0 }

    strengths.append(contentsOf: relatedStrengths)
    weaknesses.append(contentsOf: relatedWeaknesses)

    return (strengths, weaknesses)
  }
}

private extension Array where Element == Models.PokemonTypes.PokemonType {
  func filtered(types: [String]) -> Self {
    types.count > 0 ?
      filter {
        types.contains($0.name)
      } : self
  }
}

private extension Array where Element == Models.PokemonTypes.Efficiency {
  func groupedByFactor() -> [Int: [Models.PokemonTypes.Efficiency]] {
    Dictionary(grouping: self, by: { $0.factor })
  }

  func rows() -> (row1: [Element], row2: [Element], row3: [Element]) {
    let maxRowSize = 5
    let rows = Double(count) / Double(maxRowSize)
    let row1Split = self[0 ..< (rows > 1 ? maxRowSize : count)]
    let row2Split = rows > 1 ? self[maxRowSize ..< (rows > 2 ? maxRowSize * 2 : count)] : []
    let row3Split = rows > 2 ? self[(maxRowSize * 2) ..< count] : []
    return (row1: Array(row1Split), row2: Array(row2Split), row3: Array(row3Split))
  }
}
