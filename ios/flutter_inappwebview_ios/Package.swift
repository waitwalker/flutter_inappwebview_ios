// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "flutter_inappwebview_ios",
  platforms: [
    .iOS(.v13)
  ],
  products: [
    .library(name: "flutter-inappwebview-ios", targets: ["flutter_inappwebview_ios"])
  ],
  dependencies: [
    .package(name: "FlutterFramework", path: "../FlutterFramework"),
    .package(url: "https://github.com/Weebly/OrderedSet.git", exact: "6.0.3"),
  ],
  targets: [
    .target(
      name: "flutter_inappwebview_ios",
      dependencies: [
        .product(name: "FlutterFramework", package: "FlutterFramework"),
        .product(name: "OrderedSet", package: "OrderedSet"),
        "flutter_inappwebview_ios_resources",
      ],
      path: "Sources/flutter_inappwebview_ios",
      exclude: [
        "InAppWebViewFlutterPlugin.h",
        "InAppWebViewFlutterPlugin.m",
        "Resources",
        "Storyboards",
      ],
      linkerSettings: [
        .linkedLibrary("swiftCoreGraphics")
      ]
    ),
    .target(
      name: "flutter_inappwebview_ios_resources",
      path: "Sources/flutter_inappwebview_ios_resources",
      resources: [
        .process("Resources/PrivacyInfo.xcprivacy"),
        .process("Storyboards/WebView.storyboard"),
      ]
    ),
  ]
)
