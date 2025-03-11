//
//  TodoDashboardInterface.swift
//  Todo
//
//  Created by 홍성준 on 3/11/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import RIBs

// MARK: - TodoDashboardListener

public protocol TodoDashboardListener: AnyObject {}

// MARK: - TodoDashboardRouting

public protocol TodoDashboardRouting: ViewableRouting {}

// MARK: - TodoDashboardBuildDependency

public struct TodoDashboardBuildDependency {
  public let listener: TodoDashboardListener
  
  public init(listener: TodoDashboardListener) {
    self.listener = listener
  }
}

// MARK: - TodoDashboardBuildable

public protocol TodoDashboardBuildable: Buildable {
  func build(with dynamicBuildDependency: TodoDashboardBuildDependency) -> TodoDashboardRouting
}
