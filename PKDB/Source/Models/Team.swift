//
//  Team.swift
//  PKDB
//
//  Created by Bruce Rick on 2021-12-13.
//

import Foundation

extension Models {
  struct Team: Equatable, Codable {
    let id: Int
    var name: String
    let game: String
    var pokemon: [Pokemon]
  }
}

extension Models.Team {
  struct Pokemon: Equatable, Codable {
    let id: Int
    let pokedex: String
    let name: String
    let types: [String]
    var ability: Ability?
    let stats: [Stat]
    var moves: [Move] = []
  }
}

extension Models.Team.Pokemon {
  struct Ability: Equatable, Codable {
    let isHidden: Bool
    let name: String
    let text: String
    let effect: String
  }

  struct Stat: Equatable, Codable {
    let base: Int
    let name: String
  }

  struct Move: Equatable, Codable {
    let name: String
    let type: String
    let damageClass: String
    let power: Int?
  }
}
