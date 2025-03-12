//
//  CalendarInterface.swift
//  CalendarInterface
//
//  Created by 홍성준 on 2/13/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import Foundation

import RIBs

// MARK: - CalendarListener

public protocol CalendarListener: AnyObject {}

// MARK: - CalendarRouting

public protocol CalendarRouting: ViewableRouting {
  func attachDetail(date: Date)
  func detachDetail()
}

// MARK: - CalendarBuildDependency

public struct CalendarBuildDependency {
  public let listener: CalendarListener
  
  public init(listener: CalendarListener) {
    self.listener = listener
  }
}

// MARK: - CalendarBuildable

public protocol CalendarBuildable: Buildable {
  func build(with dynamicBuildDependency: CalendarBuildDependency) -> CalendarRouting
}
