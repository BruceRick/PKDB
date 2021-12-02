//
//  Evolution.swift
//  PKDB
//
//  Created by Bruce Rick on 2021-12-02.
//

import Foundation

extension Models {
  struct Evolution {
    let id: Int
    let pokemon: String
    let trigger: String?
    let item: String?
    let location: String?
    let gender: String?
    let timeOfDay: String?
    let minLevel: Int?
    let minHappiness: Int?
    let minBeauty: Int?
    let minAffection: Int?
  }
}
