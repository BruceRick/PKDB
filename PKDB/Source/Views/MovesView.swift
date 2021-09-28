//
//  MovesView.swift
//  PKDB
//
//  Created by Bruce Rick on 2021-09-05.
//

import SwiftUI
import Combine

struct MovesView: View {
  let pokemon: String
  let game: String
  @State private var learnMethod = LearnMethod.Level

  // swiftlint:disable identifier_name
  enum LearnMethod: String, CaseIterable {
    case Level
    case Machine
    case Breeding
    case Tutoring

    var value: String {
      switch self {
      case .Level:
        return "level-up"
      case .Machine:
        return "machine"
      case .Breeding:
        return "egg"
      case .Tutoring:
        return "tutor"
      }
    }
  }
  // swiftlint:enable identifier_name

  func filteredMoves(moves: [Models.Move]) -> [Models.Move] {
    moves.filter {
      $0.learnMethod == learnMethod.value
    }.sorted {
      switch learnMethod {
      case .Level where $0.level != $1.level:
        return $0.level < $1.level
      case .Machine:
        if let item1 = $0.item, let item2 = $1.item {
          return item1 < item2
        }
        fallthrough
      default:
        return $0.name < $1.name
      }
    }
  }

  var body: some View {
    APIContentView(request: moves) { moves in
      List {
        Section(header: header) {
          ForEach(filteredMoves(moves: moves ?? []), id: \.id) { move in
            cell(move: move)
          }
        }
      }
    }
    .navigationTitle("Moves")
  }

  var header: some View {
    Picker(selection: $learnMethod, label: Text("Learn Method")) {
      ForEach(LearnMethod.allCases, id: \.rawValue) { method in
        Text(method.rawValue).tag(method)
      }
    }
    .pickerStyle(SegmentedPickerStyle())
  }

  func cell(move: Models.Move) -> some View {
    HStack(spacing: 5) {
      if move.level != 0 {
        roundedText(string: "LV \(move.level)")
      } else if let item = move.item {
        roundedText(string: "\(item.uppercased())")
      }
      VStack(alignment: .leading, spacing: 5) {
        Text(move.name.capitalized.replacingOccurrences(of: "-", with: " "))
          .fontWeight(.bold)
        Text(move.damageClass.capitalized)
      }
      Spacer()
      if let power = move.power {
        Text("\(power)")
          .fontWeight(.bold)
          .padding(10)
          .background(Color(.systemGray4))
          .clipShape(Capsule())
      }
      TypeIconView(type: move.type)
    }
    .padding(.vertical, 10)
  }

  func roundedText(string: String) -> some View {
    Text(string)
      .fontWeight(.bold)
      .padding(.vertical, 10)
      .frame(width: 70)
      .background(Color(.systemGray4))
      .clipShape(Capsule())
      .padding(.trailing, 10)
  }
}

extension MovesView {
  func moves() -> AnyPublisher<[Models.Move]?, Error> {
    API.pokemonMoves(pokemon: pokemon, game: game)
  }
}
