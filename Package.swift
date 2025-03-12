// swift-tools-version:5.7
@preconcurrency import PackageDescription

#if TUIST
@preconcurrency import ProjectDescription
import ProjectDescriptionHelpers

let packageSetting = PackageSettings(
  productTypes: [
//    "FlexLayout": .framework,
//    "PinLayout": .framework,
    "RIBs": .framework,
    "SwiftDate": .framework,
    "RxRelay": .framework,
  ],
  baseSettings: .settings(
    configurations: [
      .debug(name: .dev),
      .debug(name: .stage),
      .release(name: .prod)
    ]
  )
)
#endif

let package = Package(
  name: "Package",
  dependencies: [
    .package(url: "https://github.com/malcommac/SwiftDate", from: "7.0.0"),
    .package(url: "https://github.com/devxoul/Then", from: "3.0.0"),
    .package(url: "https://github.com/uber/needle", from: "0.25.1"),
    .package(url: "https://github.com/ReactiveX/RxSwift", from: "6.8.0"),
    .package(url: "https://github.com/layoutBox/PinLayout", from: "1.10.5"),
    .package(url: "https://github.com/layoutBox/FlexLayout", from: "2.1.0"),
    .package(url: "https://github.com/uber/RIBs-iOS", from: "0.16.3"),
  ]
)
