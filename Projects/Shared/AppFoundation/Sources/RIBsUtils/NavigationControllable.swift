//
//  NavigationControllable.swift
//  AppFoundation
//
//  Created by 홍성준 on 2/13/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

import RIBs

open class NavigationControllable: ViewControllable {
  
  public var uiviewController: UIViewController { navigationController }
  public let navigationController: UINavigationController
  
  public init(viewControllable: ViewControllable) {
    let navigationController = UINavigationController(rootViewController: viewControllable.uiviewController)
    navigationController.isNavigationBarHidden = true
    self.navigationController = navigationController
  }
}
