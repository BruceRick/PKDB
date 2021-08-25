//
//  APIContentView.swift
//  PKDB
//
//  Created by Bruce Rick on 2021-06-18.
//

import SwiftUI
import Combine

struct APIContentView<Content: View, Data>: View {
  var request: () -> AnyPublisher<Data?, Error>
  var content: (Data?) -> Content
  @State var state = LoadingState.initial

  @State var data: Data? = nil { didSet { didSetData() } }
  @State private var cancellable: AnyCancellable?

  var body: some View {
    content(data)
      .loading(state == .initial || state == .loading)
      .onAppear(perform: loadData)
      .opacity(state == .error ? 0 : 1)
      .overlay(errorView)
  }

  func loadData() {
    guard state != .success || state != .loading else { return }
    cancellable = request()
      .replaceError(with: nil)
      .assign(to: \.data, on: self)
  }

  func didSetData() {
    switch data {
    case .some(_):
      state = .success
    case .none:
      state = .error
    }
  }

  @ViewBuilder var errorView: some View {
    if state == .error {
      Text("An unexpected error ocurred")
        .foregroundColor(Color.red)
        .fontWeight(.bold)
    } else {
      EmptyView()
    }
  }
}

extension APIContentView {
  enum LoadingState {
    case initial
    case loading
    case success
    case error
  }
}
