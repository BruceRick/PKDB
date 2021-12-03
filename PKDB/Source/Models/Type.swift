//
//  Type.swift
//  PKDB
//
//  Created by Bruce Rick on 2021-12-02.
//

import Foundation

extension Models {
  struct PokemonType {

    struct Efficency {
      let name: String
      let factor: Int
    }

    let name: String
    let efficencies: [Efficency]
  }
}
