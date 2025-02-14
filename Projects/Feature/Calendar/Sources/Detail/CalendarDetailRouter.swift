//
//  CalendarDetailRouter.swift
//  Calendar
//
//  Created by 홍성준 on 2/14/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import RIBs

// MARK: - CalendarDetailInteractable

protocol CalendarDetailInteractable: Interactable {
  var router: CalendarDetailRouting? { get set }
  var listener: CalendarDetailListener? { get set }
}

protocol CalendarDetailViewControllable: ViewControllable {}

// MARK: - CalendarDetailRouter

final class CalendarDetailRouter:
  ViewableRouter<CalendarDetailInteractable, CalendarDetailViewControllable>,
  CalendarDetailRouting {
  
  override init(
    interactor: CalendarDetailInteractable,
    viewController: CalendarDetailViewControllable
  ) {
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
}
