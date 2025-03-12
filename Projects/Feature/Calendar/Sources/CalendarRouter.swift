//
//  CalendarRouter.swift
//  Calendar
//
//  Created by 홍성준 on 2/13/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit
import RIBs
import CalendarInterface

// MARK: - CalendarInteractable

protocol CalendarInteractable: Interactable, CalendarDetailListener {
  var router: CalendarRouting? { get set }
  var listener: CalendarListener? { get set }
}

protocol CalendarViewControllable: ViewControllable {
  func presentWithCustomTransition(_ viewControllable: ViewControllable)
}

// MARK: - CalendarRouter

final class CalendarRouter:
  ViewableRouter<CalendarInteractable, CalendarViewControllable>,
  CalendarRouting {
  
  private let calendarDetailBuilder: CalendarDetailBuildable
  private var calendarDetailRouting: ViewableRouting?

  init(
    interactor: CalendarInteractable,
    viewController: CalendarViewControllable,
    calendarDetailBuilder: CalendarDetailBuildable
  ) {
    self.calendarDetailBuilder = calendarDetailBuilder
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
}

// MARK: - CalendarRouting

extension CalendarRouter {
  
  func attachDetail(date: Date) {
    guard calendarDetailRouting == nil else { return }
    let router = calendarDetailBuilder.build(with: .init(listener: interactor, date: date))
    calendarDetailRouting = router
    attachChild(router)
    viewController.presentWithCustomTransition(router.viewControllable)
  }
  
  func detachDetail() {
    guard let router = calendarDetailRouting else { return }
    router.viewControllable.dismiss { [weak self] in
      guard let self else { return }
      calendarDetailRouting = nil
      detachChild(router)
    }
  }
}
