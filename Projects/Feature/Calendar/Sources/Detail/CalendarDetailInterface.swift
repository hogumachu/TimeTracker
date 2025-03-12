//
//  CalendarDetailInterface.swift
//  Calendar
//
//  Created by 홍성준 on 2/14/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import Foundation

import RIBs

// MARK: - CalendarDetailListener

public protocol CalendarDetailListener: AnyObject {
  func calendarDetailDidTapClose()
}

// MARK: - CalendarDetailRouting

public protocol CalendarDetailRouting: ViewableRouting {}

// MARK: - CalendarDetailBuildDependency

public struct CalendarDetailBuildDependency {
  public let listener: CalendarDetailListener
  public let date: Date
  
  public init(listener: CalendarDetailListener, date: Date) {
    self.listener = listener
    self.date = date
  }
}

// MARK: - CalendarDetailBuildable

public protocol CalendarDetailBuildable: Buildable {
  func build(with dynamicBuildDependency: CalendarDetailBuildDependency) -> CalendarDetailRouting
}
