//
//  Game.swift
//  PKDB
//
//  Created by Bruce Rick on 2021-08-26.
//

import Foundation

extension Models {
  struct Game: Equatable, Codable {
    let name: String
    let pokedexes: [String]
  }
}
