//
//  HomeDashboardRouter.swift
//  Home
//
//  Created by 홍성준 on 2/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import RIBs

import CalendarInterface
import HomeInterface

// MARK: - HomeDashboardInteractable

protocol HomeDashboardInteractable: Interactable,
                                    CalendarListener {
  var router: HomeDashboardRouting? { get set }
  var listener: HomeDashboardListener? { get set }
}

protocol HomeDashboardViewControllable: ViewControllable {
  func setViewController(_ viewControllable: ViewControllable)
}

// MARK: - HomeDashboardRouter

final class HomeDashboardRouter:
  ViewableRouter<HomeDashboardInteractable, HomeDashboardViewControllable>,
  HomeDashboardRouting {
  
  private let calendarBuilder: CalendarBuildable
  private var calendarRouting: ViewableRouting?
  
  init(
    interactor: HomeDashboardInteractable,
    viewController: HomeDashboardViewControllable,
    calendarBuilder: CalendarBuildable
  ) {
    self.calendarBuilder = calendarBuilder
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
  
  func attachCalendar() {
    guard calendarRouting == nil else { return }
    let router = calendarBuilder.build(with: .init(listener: interactor))
    calendarRouting = router
    attachChild(router)
    viewController.setViewController(router.viewControllable)
  }
}
