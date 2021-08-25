//
//  ActivityIndicator.swift
//  PKDB
//
//  Created by Bruce Rick on 2021-08-25.
//

import SwiftUI

public struct ActivityIndicator: UIViewRepresentable {
  public let style: UIActivityIndicatorView.Style
  public let color: UIColor

  public init(style: UIActivityIndicatorView.Style, color: UIColor) {
    self.style = style
    self.color = color
  }

  public func makeUIView(context: Context) -> UIActivityIndicatorView {
    let view = UIActivityIndicatorView(style: style)
    view.startAnimating()
    view.color = color
    return view
  }

  public func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
  }
}
