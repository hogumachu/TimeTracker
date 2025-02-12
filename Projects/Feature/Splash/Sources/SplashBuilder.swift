//
//  SplashBuilder.swift
//  Splash
//
//  Created by 홍성준 on 2/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import AppFoundation
import NeedleFoundation
import RIBs
import SplashInterface

// MARK: - SplashDependency

public protocol SplashDependency: NeedleFoundation.Dependency {}

// MARK: - DynamicComponentDependency

public typealias SplashComponentDepenency = Void

// MARK: - SplashComponent

public final class SplashComponent: NeedleFoundation.Component<SplashDependency> {}

// MARK: - SplashBuilder

public final class SplashBuilder:
  ComponentizedBuilder<SplashComponent, SplashRouting, SplashBuildDependency, SplashComponentDepenency>,
  SplashBuildable {
  
  override public func build(
    with component: SplashComponent,
    _ payload: SplashBuildDependency
  ) -> SplashRouting {
    let viewController = SplashViewController()
    let interactor = SplashInteractor(
      presenter: viewController
    )
    interactor.listener = payload.listener
    
    return SplashRouter(
      interactor: interactor,
      viewController: viewController
    )
  }
}
