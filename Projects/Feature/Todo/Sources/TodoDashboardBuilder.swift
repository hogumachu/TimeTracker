//
//  TodoDashboardBuilder.swift
//  Todo
//
//  Created by 홍성준 on 3/11/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import AppFoundation
import NeedleFoundation
import RIBs
import TodoInterface

// MARK: - TodoDashboardDependency

public protocol TodoDashboardDependency: NeedleFoundation.Dependency {}

// MARK: - DynamicComponentDependency

public typealias TodoDashboardComponentDepenency = Void

// MARK: - TodoDashboardComponent

public final class TodoDashboardComponent: NeedleFoundation.Component<TodoDashboardDependency> {}

// MARK: - TodoDashboardBuilder

public final class TodoDashboardBuilder:
  ComponentizedBuilder<TodoDashboardComponent, TodoDashboardRouting, TodoDashboardBuildDependency, TodoDashboardComponentDepenency>,
  TodoDashboardBuildable {
  
  override public func build(
    with component: TodoDashboardComponent,
    _ payload: TodoDashboardBuildDependency
  ) -> TodoDashboardRouting {
    let viewController = TodoDashboardViewController()
    let interactor = TodoDashboardInteractor(
      presenter: viewController
    )
    interactor.listener = payload.listener
    
    return TodoDashboardRouter(
      interactor: interactor,
      viewController: viewController
    )
  }
}
