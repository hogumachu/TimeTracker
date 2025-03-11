//
//  RootBuilder.swift
//  TimeTracker
//
//  Created by 홍성준 on 2/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import NeedleFoundation
import RIBs

import AppFoundation
import HomeInterface
import SplashInterface
import TodoInterface
import UserServiceInterface

protocol RootDependency: NeedleFoundation.Dependency {
  var userService: UserServicable { get }
  var homeDashboardBuilder: HomeDashboardBuildable { get }
  var todoDashboardBuilder: TodoDashboardBuildable { get }
  var splashBuilder: SplashBuildable { get }
}

final class RootComponent: NeedleFoundation.Component<RootDependency> {}

protocol RootBuildable: Buildable {
  func build() -> LaunchRouting
}

final class RootBuilder: ComponentizedBuilder<RootComponent, LaunchRouting, Void, Void>, RootBuildable {
  override func build(
    with component: RootComponent,
    _ dynamicBuildDependency: Void
  ) -> LaunchRouting {
    let viewController = RootViewController()
    let interactor = RootInteractor(
      presenter: viewController,
      userSerivce: component.userService
    )
    let router = RootRouter(
      interactor: interactor,
      viewController: viewController,
      homeDashboardBuilder: component.homeDashboardBuilder,
      todoDashboardBuilder: component.todoDashboardBuilder,
      splashBuilder: component.splashBuilder
    )
    return router
  }
}
