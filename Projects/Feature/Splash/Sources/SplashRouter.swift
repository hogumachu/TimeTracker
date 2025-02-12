//
//  SplashRouter.swift
//  Splash
//
//  Created by 홍성준 on 2/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import RIBs
import SplashInterface

// MARK: - SplashInteractable

protocol SplashInteractable: Interactable {
  var router: SplashRouting? { get set }
  var listener: SplashListener? { get set }
}

protocol SplashViewControllable: ViewControllable {}

// MARK: - SplashRouter

final class SplashRouter:
  ViewableRouter<SplashInteractable, SplashViewControllable>,
  SplashRouting {

  override init(
    interactor: SplashInteractable,
    viewController: SplashViewControllable
  ) {
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
}
