// swift-tools-version:5.7
@preconcurrency import PackageDescription

#if TUIST
@preconcurrency import ProjectDescription
import ProjectDescriptionHelpers

let packageSetting = PackageSettings(
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
    .package(url: "https://github.com/ReactiveX/RxSwift", from: "6.8.0"),
    .package(url: "https://github.com/layoutBox/PinLayout", from: "1.10.5"),
    .package(url: "https://github.com/layoutBox/FlexLayout", from: "2.1.0"),
    .package(url: "https://github.com/uber/RIBs-iOS", from: "0.16.3"),
  ]
)
