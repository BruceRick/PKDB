//
//  IdentifiableString.swift
//  PKDB
//
//  Created by Bruce Rick on 2021-06-18.
//

import Foundation

struct IdentifiableString: Identifiable {
  var value: String
  var id: String { value }
}

extension Array where Element == String {
  var identifiable: [IdentifiableString] {
    map { IdentifiableString(value: $0) }
  }
}
