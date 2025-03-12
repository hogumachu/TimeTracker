//
//  CalendarDetailBuilder.swift
//  Calendar
//
//  Created by 홍성준 on 2/14/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import Foundation

import NeedleFoundation
import RIBs

import AppFoundation

// MARK: - CalendarDetailDependency

public protocol CalendarDetailDependency: NeedleFoundation.Dependency {}

// MARK: - DynamicComponentDependency

public typealias CalendarDetailComponentDepenency = Void

// MARK: - CalendarDetailComponent

public final class CalendarDetailComponent: NeedleFoundation.Component<CalendarDetailDependency> {}

// MARK: - CalendarDetailBuilder

final class CalendarDetailBuilder:
  ComponentizedBuilder<CalendarDetailComponent, CalendarDetailRouting, CalendarDetailBuildDependency, CalendarDetailComponentDepenency>,
  CalendarDetailBuildable {
  
  override public func build(
    with component: CalendarDetailComponent,
    _ payload: CalendarDetailBuildDependency
  ) -> CalendarDetailRouting {
    let viewController = CalendarDetailViewController()
    let interactor = CalendarDetailInteractor(
      presenter: viewController,
      date: payload.date
    )
    interactor.listener = payload.listener
    
    return CalendarDetailRouter(
      interactor: interactor,
      viewController: viewController
    )
  }
}
