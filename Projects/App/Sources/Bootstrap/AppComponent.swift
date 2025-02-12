//
//  AppComponent.swift
//  TimeTracker
//
//  Created by 홍성준 on 2/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import Foundation

import NeedleFoundation

import Home
import HomeInterface
import Splash
import SplashInterface

final class AppComponent: BootstrapComponent {
  var rootBuilder: RootBuildable {
    RootBuilder {
      RootComponent(parent: self)
    }
  }
}

// MARK: - HomeDashboard

extension AppComponent {
  var homeDashboardBuilder: HomeDashboardBuildable {
    HomeDashboardBuilder {
      HomeDashboardComponent(parent: self)
    }
  }
}

// MARK: - Splash

extension AppComponent {
  var splashBuilder: SplashBuildable {
    SplashBuilder {
      SplashComponent(parent: self)
    }
  }
}
