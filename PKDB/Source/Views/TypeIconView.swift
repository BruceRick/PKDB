//
//  TypeView.swift
//  PKDB
//
//  Created by Bruce Rick on 2021-06-18.
//

import SwiftUI

struct TypeIconView: View {
  var type: String
  var text = false

  var body: some View {
    HStack(alignment: .center) {
      switch text {
      case true:
        fullView
      default:
        imageView
      }
    }
    .padding(10)
    .background(Color(type))
    .clipShape(Capsule())
  }

  @ViewBuilder
  var fullView: some View {
    Spacer()
    imageView
    textView
    Spacer()
  }

  var textView: some View {
    Text(type.capitalized)
      .frame(alignment: .leading)
      .font(.headline)
      .foregroundColor(.white)
  }

  var imageView: some View {
    Image(type)
      .resizable()
      .frame(width: 20, height: 20)
  }
}
