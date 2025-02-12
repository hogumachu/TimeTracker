//___FILEHEADER___

import RIBs

// MARK: - ___VARIABLE_productName___Listener

public protocol ___VARIABLE_productName___Listener: AnyObject {}

// MARK: - ___VARIABLE_productName___Routing

public protocol ___VARIABLE_productName___Routing: ViewableRouting {}

// MARK: - ___VARIABLE_productName___BuildDependency

public struct ___VARIABLE_productName___BuildDependency {
  public let listener: ___VARIABLE_productName___Listener
  
  public init(listener: ___VARIABLE_productName___Listener) {
    self.listener = listener
  }
}

// MARK: - ___VARIABLE_productName___Buildable

public protocol ___VARIABLE_productName___Buildable: Buildable {
  func build(with dynamicBuildDependency: ___VARIABLE_productName___BuildDependency) -> ___VARIABLE_productName___Routing
}
