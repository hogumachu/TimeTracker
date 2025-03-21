//
//  HomeDashboardBuilder.swift
//  Home
//
//  Created by 홍성준 on 2/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import NeedleFoundation
import RIBs

import AppFoundation
import CalendarInterface
import CalendarServiceInterface
import HomeInterface

// MARK: - HomeDashboardDependency

public protocol HomeDashboardDependency: NeedleFoundation.Dependency {
  var calendarBuilder: CalendarBuildable { get }
  var calendarService: CalendarServicable { get }
}

// MARK: - DynamicComponentDependency

public typealias HomeDashboardComponentDepenency = Void

// MARK: - HomeDashboardComponent

public final class HomeDashboardComponent: NeedleFoundation.Component<HomeDashboardDependency> {}

// MARK: - HomeDashboardBuilder

public final class HomeDashboardBuilder:
  ComponentizedBuilder<
HomeDashboardComponent,
HomeDashboardRouting,
HomeDashboardBuildDependency,
HomeDashboardComponentDepenency
>,
HomeDashboardBuildable {
  
  override public func build(
    with component: HomeDashboardComponent,
    _ payload: HomeDashboardBuildDependency
  ) -> HomeDashboardRouting {
    let viewController = HomeDashboardViewController()
    let interactor = HomeDashboardInteractor(
      presenter: viewController,
      calendarService: component.calendarService
    )
    interactor.listener = payload.listener
    
    return HomeDashboardRouter(
      interactor: interactor,
      viewController: viewController,
      calendarBuilder: component.calendarBuilder
    )
  }
}
