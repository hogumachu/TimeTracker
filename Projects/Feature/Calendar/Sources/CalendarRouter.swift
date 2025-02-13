//
//  CalendarRouter.swift
//  Calendar
//
//  Created by 홍성준 on 2/13/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import RIBs
import CalendarInterface

// MARK: - CalendarInteractable

protocol CalendarInteractable: Interactable {
  var router: CalendarRouting? { get set }
  var listener: CalendarListener? { get set }
}

protocol CalendarViewControllable: ViewControllable {}

// MARK: - CalendarRouter

final class CalendarRouter:
  ViewableRouter<CalendarInteractable, CalendarViewControllable>,
  CalendarRouting {

  override init(
    interactor: CalendarInteractable,
    viewController: CalendarViewControllable
  ) {
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
}
