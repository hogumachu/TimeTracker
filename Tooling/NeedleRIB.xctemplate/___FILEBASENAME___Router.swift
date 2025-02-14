//___FILEHEADER___

import RIBs

import ___VARIABLE_productName___Interface

// MARK: - ___VARIABLE_productName___Interactable

protocol ___VARIABLE_productName___Interactable: Interactable {
  var router: ___VARIABLE_productName___Routing? { get set }
  var listener: ___VARIABLE_productName___Listener? { get set }
}

protocol ___VARIABLE_productName___ViewControllable: ViewControllable {}

// MARK: - ___VARIABLE_productName___Router

final class ___VARIABLE_productName___Router:
  ViewableRouter<___VARIABLE_productName___Interactable, ___VARIABLE_productName___ViewControllable>,
  ___VARIABLE_productName___Routing {
  
  override init(
    interactor: ___VARIABLE_productName___Interactable,
    viewController: ___VARIABLE_productName___ViewControllable
  ) {
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
}
