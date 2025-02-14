//
//  CalendarBuilder.swift
//  Calendar
//
//  Created by 홍성준 on 2/13/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import NeedleFoundation
import RIBs

import AppFoundation
import CalendarInterface
import CalendarServiceInterface

// MARK: - CalendarDependency

public protocol CalendarDependency: NeedleFoundation.Dependency {
  var calendarService: CalendarServicable { get }
}

// MARK: - DynamicComponentDependency

public typealias CalendarComponentDepenency = Void

// MARK: - CalendarComponent

public final class CalendarComponent: NeedleFoundation.Component<CalendarDependency> {}

// MARK: - CalendarBuilder

public final class CalendarBuilder:
  ComponentizedBuilder<CalendarComponent, CalendarRouting, CalendarBuildDependency, CalendarComponentDepenency>,
  CalendarBuildable {
  
  override public func build(
    with component: CalendarComponent,
    _ payload: CalendarBuildDependency
  ) -> CalendarRouting {
    let viewController = CalendarViewController()
    let interactor = CalendarInteractor(
      presenter: viewController,
      calendarService: component.calendarService
    )
    interactor.listener = payload.listener
    
    return CalendarRouter(
      interactor: interactor,
      viewController: viewController,
      calendarDetailBuilder: CalendarDetailBuilder {
        component.detailComponent
      }
    )
  }
}

// MARK: - Child Component

extension CalendarComponent {
  var detailComponent: CalendarDetailComponent {
    CalendarDetailComponent(parent: self)
  }
}
