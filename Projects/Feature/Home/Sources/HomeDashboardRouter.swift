//
//  HomeDashboardRouter.swift
//  Home
//
//  Created by 홍성준 on 2/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import RIBs
import HomeInterface

// MARK: - HomeDashboardInteractable

protocol HomeDashboardInteractable: Interactable {
  var router: HomeDashboardRouting? { get set }
  var listener: HomeDashboardListener? { get set }
}

protocol HomeDashboardViewControllable: ViewControllable {}

// MARK: - HomeDashboardRouter

final class HomeDashboardRouter:
  ViewableRouter<HomeDashboardInteractable, HomeDashboardViewControllable>,
  HomeDashboardRouting {

  override init(
    interactor: HomeDashboardInteractable,
    viewController: HomeDashboardViewControllable
  ) {
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
}
