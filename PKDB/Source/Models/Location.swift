//
//  Location.swift
//  PKDB
//
//  Created by Bruce Rick on 2021-12-01.
//

import Foundation

extension Models {
  struct Location {
    let id: Int
    let minLevel: Int
    let maxLevel: Int
    let encounterMethod: String
    let rarity: Int
    let name: String
  }
}
