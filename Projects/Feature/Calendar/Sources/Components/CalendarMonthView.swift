//
//  CalendarMonthView.swift
//  Calendar
//
//  Created by 홍성준 on 3/11/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

import DesignSystem

import FlexLayout
import JTAppleCalendar
import PinLayout
import Then

protocol CalendarMonthViewDelegate: JTACMonthViewDelegate {}
protocol CalendarMonthViewDataSource: JTACMonthViewDataSource {}

final class CalendarMonthView: BaseView {
  
  weak var delegate: CalendarMonthViewDelegate? {
    didSet { contentView.calendarDelegate = delegate }
  }
  
  weak var dataSoruce: CalendarMonthViewDataSource? {
    didSet { contentView.calendarDataSource = dataSoruce }
  }
  
  private let containerView = UIView().with {
    $0.backgroundColor = DesignSystem.BackgroundColor.groupedBase
  }
  private let headerView = CalendarMonthHeaderView()
  private let contentView = JTACMonthView().with {
    $0.register(CalendarDayCell.self)
    $0.scrollDirection = .horizontal
    $0.scrollingMode = .stopAtEachSection
    $0.showsVerticalScrollIndicator = false
    $0.showsHorizontalScrollIndicator = false
    $0.backgroundColor = DesignSystem.BackgroundColor.base
  }
  
  override func setupLayout() {
    addSubview(containerView)
    super.setupLayout()
    
    rootView.flex
      .define {
        $0.addItem(headerView)
          .height(70)
        $0.addItem(contentView)
          .grow(1)
      }
  }
  
  func reloadData() {
    contentView.reloadData()
  }
  
  func visibleDates(
    completionHandler: ((_ segment: DateSegmentInfo) -> Void)?
  ) {
    contentView.visibleDates { completionHandler?($0) }
  }
  
  func updateHeader(title: String) {
    headerView.configure(title)
  }
  
  func scrollToDate(_ date: Date, animated: Bool) {
    contentView.scrollToDate(date, animateScroll: animated)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    containerView.pin.all()
    rootView.pin.top(pin.safeArea).horizontally().bottom()
    rootView.flex.layout()
  }
}
