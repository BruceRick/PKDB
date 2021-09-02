//
//  Pokemon.swift
//  PKDB
//
//  Created by Bruce Rick on 2021-08-25.
//

import Foundation

extension Models {
  struct PokemonDetails {
    var baseExperience: Int
    var height: Int
    var weight: Int
    var summary: String
    var description: String
    var types: [String]

    var sprites: [String: AnyObject]
    var abilities: [Ability]
    var stats: [Stat]
  }
}

extension Models.PokemonDetails {
  struct Ability {
    var isHidden: Bool
    var name: String
    var text: String
    var effect: String
  }

  struct Stat {
    var effort: Int
    var base: Int
    var name: String
  }
}
