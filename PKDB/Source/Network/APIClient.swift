//
//  Network.swift
//  PKDB
//
//  Created by Bruce Rick on 2021-06-18.
//

import Foundation
import Combine
import Apollo

struct API {
  static let imageURLString = "https://raw.githubusercontent.com/PokeAPI/sprites/master/"

  static var client: ApolloClient {
    guard let url = URL(string: "https://beta.pokeapi.co/graphql/v1beta") else { fatalError("Invalid API URL") }
    return ApolloClient(url: url)
  }
}
