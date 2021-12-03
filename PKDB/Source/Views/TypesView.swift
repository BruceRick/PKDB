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
    APIContentView(request: API.pokemonTypes) { type in
      List(type.filtered(types: selectedTypes), id: \.name) { type in
        cell(type)
      }
      .navigationTitle("Types")
    }
  }

  func cell(_ type: Models.PokemonType) -> some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack(spacing: 5) {
        TypeIconView(type: type.name, text: true)
        Spacer()
        Button(expandedType == type.name ? "Collapse" : "Expand") {
          expandedType = expandedType == type.name ? "" : type.name
        }
      }
      if expandedType == type.name {
        ForEach(type.efficencies.groupedByFactor().sorted(by: { $0.key > $1.key }), id: \.key) { factor, types in
          VStack(alignment: .leading, spacing: 10) {
            Text("\(factor)% Damage")
              .fontWeight(.bold)
            typeRows(types.rows())
          }
        }
      }
    }.padding(.vertical, 10)
  }

  @ViewBuilder func typeRows(_ rows: (
    row1: [Models.PokemonType.Efficency],
    row2: [Models.PokemonType.Efficency],
    row3: [Models.PokemonType.Efficency])
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
}

private extension Array where Element == Models.PokemonType {
  func filtered(types: [String]) -> Self {
    types.count > 0 ?
      filter {
        types.contains($0.name)
      } : self
  }
}

private extension Array where Element == Models.PokemonType.Efficency {
  func groupedByFactor() -> [Int: [Models.PokemonType.Efficency]] {
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
