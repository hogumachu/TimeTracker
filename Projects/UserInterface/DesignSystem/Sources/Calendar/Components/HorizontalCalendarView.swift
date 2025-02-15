//
//  HorizontalCalendarView.swift
//  DesignSystem
//
//  Created by 홍성준 on 2/14/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

import FlexLayout
import PinLayout
import HorizonCalendar
import Then

open class HorizontalCalendarView: BaseView {
  
  public let calendarView: CalendarView
  
  private let rootView = BaseView()
  private let headerView = CalendarHeaderView()
  
  public required init(initialContent content: CalendarViewContent) {
    self.calendarView = CalendarView(initialContent: content)
    super.init()
  }
  
  open override func setupLayout() {
    super.setupLayout()
    addSubview(rootView)
    rootView.flex
      .justifyContent(.start)
      .define {
        $0.addItem(headerView)
          .height(10%)
        $0.addItem(calendarView)
          .height(90%)
      }
  }
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    rootView.pin.all()
    rootView.flex.layout()
  }
}
