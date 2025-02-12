//
//  RootBuilder.swift
//  TimeTracker
//
//  Created by 홍성준 on 2/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import AppFoundation
import NeedleFoundation
import RIBs

protocol RootDependency: NeedleFoundation.Dependency {}

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
    let interactor = RootInteractor(presenter: viewController)
    let router = RootRouter(
      interactor: interactor,
      viewController: viewController
    )
    return router
  }
}
