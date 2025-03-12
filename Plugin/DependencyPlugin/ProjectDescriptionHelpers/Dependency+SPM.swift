@preconcurrency import ProjectDescription

public extension TargetDependency {
  struct SPM {}
}

public extension TargetDependency.SPM {
  static let SwiftDate = TargetDependency.external(name: "SwiftDate")
  static let Then = TargetDependency.external(name: "Then")
  static let Needle = TargetDependency.external(name: "NeedleFoundation")
  static let RxSwift = TargetDependency.external(name: "RxSwift")
  static let RxCocoa = TargetDependency.external(name: "RxCocoa")
  static let PinLayout = TargetDependency.external(name: "PinLayout")
  static let FlexLayout = TargetDependency.external(name: "FlexLayout")
  static let RIBs = TargetDependency.external(name: "RIBs")
}

public extension Package {
}
