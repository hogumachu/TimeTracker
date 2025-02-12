//
//  RootRouter.swift
//  TimeTracker
//
//  Created by 홍성준 on 2/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import RIBs

protocol RootInteractable: Interactable {
  var router: RootRouting? { get set }
  var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>,
                        RootRouting {
  
  override init(interactor: RootInteractable, viewController: RootViewControllable) {
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
}
