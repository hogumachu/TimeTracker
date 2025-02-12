//
//  SplashInterface.swift
//  Splash
//
//  Created by 홍성준 on 2/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import RIBs

// MARK: - SplashListener

public protocol SplashListener: AnyObject {
  func splashCompleted()
}

// MARK: - SplashRouting

public protocol SplashRouting: ViewableRouting {}

// MARK: - SplashBuildDependency

public struct SplashBuildDependency {
  public let listener: SplashListener
  
  public init(listener: SplashListener) {
    self.listener = listener
  }
}

// MARK: - SplashBuildable

public protocol SplashBuildable: Buildable {
  func build(with dynamicBuildDependency: SplashBuildDependency) -> SplashRouting
}
