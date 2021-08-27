//
//  APIContentView.swift
//  PKDB
//
//  Created by Bruce Rick on 2021-06-18.
//

import SwiftUI
import Combine

struct APIContentView<Content: View, Data>: View {
  let request: () -> AnyPublisher<Data?, Error>
  @ViewBuilder let content: (Data?) -> Content
  @State var data: Data? = nil { didSet { didSetData() } }
  @State var state = LoadingState.initial
  @State private var cancellable: AnyCancellable?

  var loading: Bool {
    state == .initial || state == .loading
  }

  var body: some View {
    content(data)
      .loading(loading)
      .onAppear(perform: loadData)
      .opacity(state == .error ? 0 : 1)
      .overlay(errorView)
  }

  func loadData() {
    guard state == .initial else { return }
    state = .loading
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
