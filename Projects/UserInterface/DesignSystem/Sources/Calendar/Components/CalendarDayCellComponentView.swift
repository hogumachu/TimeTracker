//
//  CalendarDayCellComponentView.swift
//  DesignSystem
//
//  Created by 홍성준 on 3/10/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import Foundation

public enum CalendarDayCellComponentItem: Equatable {
  case schedule(CalendarDayCellScheduleComponentItem)
  case todo(CalendarDayCellTodoComponentItem)
}

public struct CalendarDayCellScheduleComponentItem: Equatable {
  
  public init() {}
}

public struct CalendarDayCellTodoComponentItem: Equatable {
  
  public init() {}
}
