//
//  RootRouter.swift
//  TimeTracker
//
//  Created by 홍성준 on 2/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import RIBs

import AppFoundation
import HomeInterface
import SplashInterface
import TodoInterface

protocol RootInteractable:
  Interactable,
  HomeDashboardListener,
  TodoDashboardListener,
  SplashListener {
  var router: RootRouting? { get set }
  var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
  func setTabs(_ viewControllables: [ViewControllable], animated: Bool)
}

final class RootRouter:
  LaunchRouter<RootInteractable, RootViewControllable>,
  RootRouting {
  
  private let homeDashboardBuilder: HomeDashboardBuildable
  private var homeDashboardRouting: ViewableRouting?
  private let todoDashboardBuilder: TodoDashboardBuildable
  private var todoDashboardRouting: ViewableRouting?
  private let splashBuilder: SplashBuildable
  private var splashRouting: ViewableRouting?
  
  init(
    interactor: RootInteractable,
    viewController: RootViewControllable,
    homeDashboardBuilder: HomeDashboardBuildable,
    todoDashboardBuilder: TodoDashboardBuildable,
    splashBuilder: SplashBuildable
  ) {
    self.homeDashboardBuilder = homeDashboardBuilder
    self.todoDashboardBuilder = todoDashboardBuilder
    self.splashBuilder = splashBuilder
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
  
  func attachTabs() {
    guard homeDashboardRouting == nil,
          todoDashboardRouting == nil
    else { return }
    let homeRouter = homeDashboardBuilder.build(with: .init(listener: interactor))
    homeDashboardRouting = homeRouter
    attachChild(homeRouter)
    
    let todoRouter = todoDashboardBuilder.build(with: .init(listener: interactor))
    todoDashboardRouting = todoRouter
    attachChild(todoRouter)
    
    viewController.setTabs(
      [
        NavigationControllable(viewControllable: homeRouter.viewControllable),
        NavigationControllable(viewControllable: todoRouter.viewControllable),
      ],
      animated: false
    )
  }
  
  func attachSplash() {
    guard splashRouting == nil else { return }
    let router = splashBuilder.build(with: .init(listener: interactor))
    splashRouting = router
    attachChild(router)
    viewController.present(router.viewControllable)
  }
  
  func detachSplash() {
    guard let router = splashRouting else { return }
    detachChild(router)
    splashRouting = nil
    router.viewControllable.dismiss()
  }
}
