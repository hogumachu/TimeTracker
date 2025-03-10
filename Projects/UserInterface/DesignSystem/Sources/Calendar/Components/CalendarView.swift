//
//  CalendarView.swift
//  DesignSystem
//
//  Created by 홍성준 on 2/27/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

import FlexLayout
import JTAppleCalendar
import PinLayout
import Then

public protocol CalendarViewDelegate: JTACMonthViewDelegate {
  func calendarViewDidSelectHeader(_ view: CalendarView)
  func calendarViewDidSelectSearch(_ view: CalendarView)
  func calendarViewDidSelectNotification(_ view: CalendarView)
}

public protocol CalendarViewDataSource: JTACMonthViewDataSource {
  
}

open class CalendarView: BaseView {
  
  // MARK: - Public properties
  
  public weak var delegate: CalendarViewDelegate? {
    didSet { monthView.calendarDelegate = delegate }
  }
  
  public weak var dataSource: CalendarViewDataSource? {
    didSet { monthView.calendarDataSource = dataSource }
  }
  
  public let monthView = JTACMonthView().with {
    $0.scrollDirection = .horizontal
    $0.scrollingMode = .stopAtEachSection
    $0.showsVerticalScrollIndicator = false
    $0.showsHorizontalScrollIndicator = false
  }
  
  // MARK: - Internal properties
  
  private let rootView = UIView().with {
    $0.backgroundColor = DesignSystem.BackgroundColor.base
  }
  private let headerView = CalendarHeaderView()
  
  open override func setupLayout() {
    super.setupLayout()
    addSubview(rootView)
    rootView.flex
      .define {
        $0.addItem(headerView)
          .height(10%)
        $0.addItem(monthView)
          .height(90%)
      }
  }
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    rootView.pin.all(pin.safeArea)
    rootView.flex.layout()
  }
}
