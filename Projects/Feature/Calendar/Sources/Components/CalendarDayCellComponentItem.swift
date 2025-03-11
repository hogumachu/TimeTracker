//
//  CalendarDayCellComponentItem.swift
//  Calendar
//
//  Created by 홍성준 on 3/11/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import Foundation

enum CalendarDayCellComponentItem: Equatable {
  case schedule(CalendarDayCellScheduleComponentItem)
  case todo(CalendarDayCellTodoComponentItem)
}

struct CalendarDayCellScheduleComponentItem: Equatable {}

struct CalendarDayCellTodoComponentItem: Equatable {}
