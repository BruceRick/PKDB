//
//  APIContentView.swift
//  PKDB
//
//  Created by Bruce Rick on 2021-06-18.
//

import SwiftUI
import Combine

struct APIContentView<Content: View, Data>: View {
  let request: () -> AnyPublisher<Data, Error>
  @ViewBuilder let content: (Data) -> Content
  @State var state = LoadingState.initial
  @State private var cancellable: AnyCancellable?

  var loading: Bool {
    state == .initial || state == .loading
  }

  var body: some View {
    main
      .onAppear(perform: loadData)
  }

  @ViewBuilder
  var main: some View {
    switch state {
    case .success(let data):
      content(data)
    case .loading, .initial:
      VStack {
        Spacer()
        ActivityIndicator(style: .medium, color: (.init(named: "LoadingColor") ?? .black))
        Spacer()
      }
    case .error(_):
      VStack {
        Spacer()
        errorView
        Spacer()
      }
    }
  }

  func loadData() {
    guard state == .initial else { return }
    state = .loading
    cancellable = request()
      .map { LoadingState.success($0) }
      .catch { Just(LoadingState.error($0)) }
      .assign(to: \.state, on: self)
  }

  @ViewBuilder var errorView: some View {
    Text("An unexpected error ocurred")
      .foregroundColor(Color.red)
      .fontWeight(.bold)
  }
}

extension APIContentView {
  enum LoadingState: Equatable {
    case initial
    case loading
    case success(Data)
    case error(Error)

    static func == (state1: LoadingState, state2: LoadingState) -> Bool {
      switch (state1, state2) {
      case (.initial, .initial),
        (.loading, .loading),
        (.success, .success),
        (.error, .error):
        return true
      default:
        return false
      }
    }
  }
}
