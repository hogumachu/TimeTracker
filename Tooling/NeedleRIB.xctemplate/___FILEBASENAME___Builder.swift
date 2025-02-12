//___FILEHEADER___

import AppFoundation
import NeedleFoundation
import RIBs
import ___VARIABLE_productName___Interface

// MARK: - ___VARIABLE_productName___Dependency

public protocol ___VARIABLE_productName___Dependency: NeedleFoundation.Dependency {}

// MARK: - DynamicComponentDependency

public typealias ___VARIABLE_productName___ComponentDepenency = Void

// MARK: - ___VARIABLE_productName___Component

public final class ___VARIABLE_productName___Component: NeedleFoundation.Component<___VARIABLE_productName___Dependency> {}

// MARK: - ___VARIABLE_productName___Builder

public final class ___VARIABLE_productName___Builder:
  ComponentizedBuilder<
___VARIABLE_productName___Component,
___VARIABLE_productName___Routing,
___VARIABLE_productName___BuildDependency,
___VARIABLE_productName___ComponentDepenency
>,
___VARIABLE_productName___Buildable
{
  
  override public func build(
    with component: ___VARIABLE_productName___Component,
    _ payload: ___VARIABLE_productName___BuildDependency
  ) -> ___VARIABLE_productName___Routing {
    let viewController = ___VARIABLE_productName___ViewController()
    let interactor = ___VARIABLE_productName___Interactor(
      presenter: viewController
    )
    interactor.listener = payload.listener
    
    return ___VARIABLE_productName___Router(
      interactor: interactor,
      viewController: viewController
    )
  }
}
