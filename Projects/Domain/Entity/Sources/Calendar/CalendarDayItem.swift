//
//  CalendarDayItem.swift
//  Entity
//
//  Created by 홍성준 on 3/10/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import Foundation

public enum CalendarDayComponent: Equatable {
  case schedule(ScheduleItem)
  case todo(TodoItem)
}

public struct CalendarDayItem: Equatable {
  public let day: Int
  public let date: Date
  public let components: [CalendarDayComponent]
  
  public init(
    day: Int,
    date: Date,
    components: [CalendarDayComponent]
  ) {
    self.day = day
    self.date = date
    self.components = components
  }
}
