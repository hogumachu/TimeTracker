//
//  CalendarView.swift
//  Calendar
//
//  Created by 홍성준 on 3/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

import DesignSystem

import FlexLayout
import PinLayout
import Then

final class CalendarView: BaseView {
  
  private let containerView = UIView().with {
    $0.backgroundColor = DesignSystem.BackgroundColor.groupedBase
  }
  private let headerView = CalendarMonthHeaderView()
  private let contentView = CalendarMonthView()
  
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
  
  func updateHeader(title: String) {
    headerView.configure(title)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    containerView.pin.all()
    rootView.pin.top(pin.safeArea).horizontally().bottom()
    rootView.flex.layout()
  }
}
