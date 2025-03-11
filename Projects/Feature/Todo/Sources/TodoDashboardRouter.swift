//
//  TodoDashboardRouter.swift
//  Todo
//
//  Created by 홍성준 on 3/11/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import RIBs
import TodoInterface

// MARK: - TodoDashboardInteractable

protocol TodoDashboardInteractable: Interactable {
  var router: TodoDashboardRouting? { get set }
  var listener: TodoDashboardListener? { get set }
}

protocol TodoDashboardViewControllable: ViewControllable {}

// MARK: - TodoDashboardRouter

final class TodoDashboardRouter:
  ViewableRouter<TodoDashboardInteractable, TodoDashboardViewControllable>,
  TodoDashboardRouting {
  
  override init(
    interactor: TodoDashboardInteractable,
    viewController: TodoDashboardViewControllable
  ) {
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
}
