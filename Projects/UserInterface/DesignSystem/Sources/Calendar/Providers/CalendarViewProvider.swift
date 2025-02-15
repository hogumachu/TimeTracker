//
//  CalendarViewProvider.swift
//  DesignSystem
//
//  Created by 홍성준 on 2/14/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

import SwiftDate
import HorizonCalendar

public enum CalendarViewProvider {
  public static func makeHorizontalCalendarView(
    today: Date = .now
  ) -> HorizontalCalendarView {
    let startDate = today - 1.years
    let endDate = today + 1.years
    let visibleDateRange: ClosedRange<Date> = startDate...endDate
    let monthsLayout: MonthsLayout = .horizontal(options: .init())
    let content = CalendarViewContent(
      visibleDateRange: visibleDateRange,
      monthsLayout: monthsLayout
    )
    return .init(initialContent: content)
  }
}
