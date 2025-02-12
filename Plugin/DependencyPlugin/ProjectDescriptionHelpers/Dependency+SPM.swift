@preconcurrency import ProjectDescription

public extension TargetDependency {
  struct SPM {}
}

public extension TargetDependency.SPM {
  static let RxSwift = TargetDependency.external(name: "RxSwift")
  static let PinLayout = TargetDependency.external(name: "PinLayout")
  static let FlexLayout = TargetDependency.external(name: "FlexLayout")
  static let RIBs = TargetDependency.external(name: "RIBs")
}

public extension Package {
}
