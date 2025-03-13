//
//  CalendarContentView.swift
//  Calendar
//
//  Created by 홍성준 on 3/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

import DesignSystem

import FlexLayout
import HorizonCalendar
import PinLayout
import Then

final class CalendarContentView: BaseView {
  
  private let containerView = UIView().with {
    $0.backgroundColor = DesignSystem.BackgroundColor.groupedBase
  }
  private let headerView = CalendarMonthHeaderView()
  private lazy var calendarView = CalendarView(initialContent: makeContent())
  
  override func setupLayout() {
    addSubview(containerView)
    super.setupLayout()
    
    rootView.flex
      .define {
        $0.addItem(headerView)
          .height(70)
        $0.addItem(calendarView)
          .grow(1)
      }
  }
  
  func updateHeader(title: String) {
    headerView.configure(title)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    containerView.pin.all()
    rootView.pin.top(pin.safeArea).horizontally().bottom()
    rootView.flex.layout()
  }
  
  private func makeContent() -> CalendarViewContent {
    let calendar = Calendar.current
    let startDate = calendar.date(from: DateComponents(year: 2025, month: 01, day: 01))!
    let endDate = calendar.date(from: DateComponents(year: 2025, month: 12, day: 31))!
    
    return CalendarViewContent(
      calendar: calendar,
      visibleDateRange: startDate...endDate,
      monthsLayout: .horizontal
    )
    .monthHeaderItemProvider { month in
      CalendarMonthLabel.calendarItemModel(
        invariantViewProperties: .init(
          font: DesignSystem.Typography.subtitle1,
          textColor: DesignSystem.TextColor.primary,
          backgroundColor: DesignSystem.BackgroundColor.groupedBase
        ),
        content: .init(month: month)
      )
    }
    .dayOfWeekItemProvider { month, weekdayIndex in
      CalendarDayOfWeekLabel.calendarItemModel(
        invariantViewProperties: .init(
          font: DesignSystem.Typography.caption1,
          backgroundColor: DesignSystem.BackgroundColor.groupedBase
        ),
        content: Self.makeDayOfWeekyContent(month, weekdayIndex)
      )
    }
    .dayItemProvider { day in
      CalendarDayLabel.calendarItemModel(
        invariantViewProperties: .init(
          font: DesignSystem.Typography.caption1,
          textColor: DesignSystem.TextColor.primary,
          borderColor: .clear
        ),
        content: .init(day: day)
      )
    }
    .interMonthSpacing(0)
    .verticalDayMargin(8)
    .horizontalDayMargin(0)
  }
  
  private static func makeDayOfWeekyContent(
    _ month: MonthComponents?,
    _ weekdayIndex: Int
  ) -> CalendarDayOfWeekLabel.Content {
    let text: String = {
      switch weekdayIndex {
      case 0: "일"
      case 1: "월"
      case 2: "화"
      case 3: "수"
      case 4: "목"
      case 5: "금"
      case 6: "토"
      default: ""
      }
    }()
    return .init(
      text: text,
      textColor: weekdayIndex == 0 ? DesignSystem.SubColor.red100 : DesignSystem.TextColor.primary
    )
  }
}
