//
//  CalendarDayModel.swift
//  Calendar
//
//  Created by 홍성준 on 3/10/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import Foundation

import DesignSystem
import Entity

public struct CalendarDayModel: Equatable {
  public let item: CalendarDayItem
  public let isSelected: Bool
  
  public init(item: CalendarDayItem, isSelected: Bool) {
    self.item = item
    self.isSelected = isSelected
  }
}

extension CalendarDayModel {
  var cellModel: CalendarDayCellModel {
    .init(
      day: item.day,
      date: item.date,
      isSelected: isSelected,
      items: item.components.map(\.componentItem)
    )
  }
}

extension CalendarDayComponent {
  var componentItem: CalendarDayCellComponentItem {
    switch self {
    case let .schedule(item):
        .schedule(.init())
      
    case let .todo(item):
        .todo(.init())
    }
  }
}
