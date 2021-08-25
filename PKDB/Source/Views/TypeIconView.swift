//
//  TypeView.swift
//  PKDB
//
//  Created by Bruce Rick on 2021-06-18.
//

import SwiftUI

struct TypeIconView: View {
  var type: String

  var body: some View {
    Image(type)
    .resizable()
    .frame(width: 20, height: 20)
    .padding(10)
    .background(Color(type))
    .clipShape(Capsule())
  }
}
