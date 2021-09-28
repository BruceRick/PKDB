//
//  Move.swift
//  PKDB
//
//  Created by Bruce Rick on 2021-09-02.
//

import Foundation

extension Models {
  struct Move {
    let id: Int
    let name: String
    let type: String
    let damageClass: String
    let learnMethod: String
    let item: String?
    let power: Int?
    let level: Int
  }
}
