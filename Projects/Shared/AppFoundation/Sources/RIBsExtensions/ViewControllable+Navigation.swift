//
//  ViewControllable+Navigation.swift
//  AppFoundation
//
//  Created by 홍성준 on 2/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import RIBs
import UIKit

@MainActor
extension ViewControllable {
  public var navigationController: UINavigationController? {
    uiviewController as? UINavigationController ?? uiviewController.navigationController
  }
  
  public func present(
    _ viewControllable: ViewControllable,
    animated: Bool = true,
    completion: (() -> Void)? = nil
  ) {
    uiviewController.present(
      viewControllable.uiviewController,
      animated: animated,
      completion: completion
    )
  }
  
  public func dismiss(
    _ viewController: ViewControllable,
    animated: Bool = true,
    completion: (() -> Void)? = nil
  ) {
    viewController.uiviewController.dismiss(
      animated: animated,
      completion: completion
    )
  }
  
  public func pushViewController(
    _ viewControllable: ViewControllable,
    animated: Bool = true
  ) {
    navigationController?.pushViewController(
      viewControllable.uiviewController,
      animated: animated
    )
  }
  
  public func popViewController(animated: Bool = true) {
    navigationController?.popViewController(
      animated: animated
    )
  }
  
  public func popToRoot(animated: Bool = true) {
    navigationController?.popToRootViewController(
      animated: animated
    )
  }
  
  public func setViewControllers(
    _ viewControllerables: [ViewControllable],
    animated: Bool = false
  ) {
    navigationController?.setViewControllers(
      viewControllerables.map(\.uiviewController),
      animated: animated
    )
  }
}
