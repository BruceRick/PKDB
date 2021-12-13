//
//  SearchableModifier.swift
//  PKDB
//
//  Created by Bruce Rick on 2021-12-13.
//

import SwiftUI

struct SearchableModifier: ViewModifier {
  @Binding var text: String

  func body(content: Content) -> some View {
    if #available(iOS 15.0, *) {
      content.searchable(text: $text)
    } else {
      content
    }
  }
}

public extension View {
  func searchableSafe(text: Binding<String>) -> some View {
    modifier(SearchableModifier(text: text))
  }
}
