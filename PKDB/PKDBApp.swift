//
//  PKDBApp.swift
//  PKDB
//
//  Created by Bruce Rick on 2021-06-15.
//

import SwiftUI

@main
struct PKDBApp: App {

  init() {
    NotificationCenter.default
      .addObserver(forName: UIApplication.willTerminateNotification, object: nil, queue: .main) { _ in
      Storage.saveSprites()
    }
  }

  var body: some Scene {
    WindowGroup {
      MainView()
    }
  }
}
