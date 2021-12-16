//
//  Storage.swift
//  Storage
//
//  Created by Bruce Rick on 2021-12-06.
//

import Foundation

struct Storage {
  // swiftlint:disable identifier_name
  enum Key: String {
    case Game
    case Pokedex
    case Sprites
  }
  // swiftlint:enable identifier_name

  static let defaults = UserDefaults.standard
  static let encoder = JSONEncoder()
  static let decoder = JSONDecoder()

  static func set<T: Encodable>(_ value: T?, key: Storage.Key) {
    if let encoded = try? encoder.encode(value) {
      defaults.set(encoded, forKey: key.rawValue)
    }
  }

  static func get<T: Codable>(_ key: Storage.Key) -> T? {
    guard let value = defaults.object(forKey: key.rawValue) as? Data else {
      return nil
    }

    return try? decoder.decode(T.self, from: value)
  }
}

extension Storage {
  static var sprites: [Int: Data] = get(.Sprites) ?? [:]

  static func getSpriteData(pokemonId: Int) -> Data? {
    sprites[pokemonId]
  }

  static func setSpriteData(pokemonId: Int, data: Data) {
    sprites[pokemonId] = data
  }

  static func saveSprites() {
    set(sprites, key: .Sprites)
  }
}
