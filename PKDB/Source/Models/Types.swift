//
//  Types.swift
//  PKDB
//
//  Created by Bruce Rick on 2021-12-02.
//

import Foundation

extension Models {
  struct PokemonTypes {
    let all: [PokemonType]
  }
}

extension Models.PokemonTypes {
  struct PokemonType {
    let name: String
    let efficiencies: [Efficiency]
  }

  struct Efficiency {
    let name: String
    let factor: Int
  }
}
