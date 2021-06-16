// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Lint",
  dependencies: [
    .package(
      url: "https://github.com/realm/SwiftLint",
      from: "0.39.1"
    )
  ]
)
