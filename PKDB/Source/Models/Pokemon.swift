//
//  Pokemon.swift
//  PKDB
//
//  Created by Bruce Rick on 2021-08-25.
//

import Foundation

extension Models {
  struct PokemonDetails {
    let baseExperience: Int
    let height: Int
    let weight: Int
    let summary: String
    let description: String
    let types: [String]

    let sprites: [String: AnyObject]
    let abilities: [Ability]
    let stats: [Stat]
  }
}

extension Models.PokemonDetails {
  struct Ability {
    let isHidden: Bool
    let name: String
    let text: String
    let effect: String
  }

  struct Stat {
    let effort: Int
    let base: Int
    let name: String
  }
}
