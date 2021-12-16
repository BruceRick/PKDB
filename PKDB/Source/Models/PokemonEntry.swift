//
//  PokemonEntry.swift
//  PKDB
//
//  Created by Bruce Rick on 2021-08-25.
//

import Foundation

extension Models {
  struct PokemonEntry {
    let id: Int
    let name: String
    let number: Int
    let types: [String]
    let stats: [Stat]
  }
}

extension Models.PokemonEntry {
  struct Stat {
    let effort: Int
    let base: Int
    let name: String
  }
}
