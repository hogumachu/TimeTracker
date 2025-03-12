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
  public let isInVisiableMonth: Bool
  
  public init(
    item: CalendarDayItem,
    isSelected: Bool,
    isInVisiableMonth: Bool
  ) {
    self.item = item
    self.isSelected = isSelected
    self.isInVisiableMonth = isInVisiableMonth
  }
}
