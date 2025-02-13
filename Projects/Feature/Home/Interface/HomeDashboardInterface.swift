//
//  HomeDashboardInterface.swift
//  Home
//
//  Created by 홍성준 on 2/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import RIBs

// MARK: - HomeDashboardListener

public protocol HomeDashboardListener: AnyObject {}

// MARK: - HomeDashboardRouting

public protocol HomeDashboardRouting: ViewableRouting {
  func attachCalendar()
}

// MARK: - HomeDashboardBuildDependency

public struct HomeDashboardBuildDependency {
  public let listener: HomeDashboardListener
  
  public init(listener: HomeDashboardListener) {
    self.listener = listener
  }
}

// MARK: - HomeDashboardBuildable

public protocol HomeDashboardBuildable: Buildable {
  func build(with dynamicBuildDependency: HomeDashboardBuildDependency) -> HomeDashboardRouting
}
