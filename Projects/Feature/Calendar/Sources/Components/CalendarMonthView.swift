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
import PinLayout
import Then

final class CalendarMonthView: BaseView {
  
  private enum Constants {
    static let range = 0..<6
  }
  
  override func setupLayout() {
    super.setupLayout()
    rootView.flex
      .define { flex in
        Constants.range.forEach { _ in
          flex.addItem(CalendarMonthWeekView())
        }
      }
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    rootView.pin.all()
    rootView.flex.layout(mode: .adjustHeight)
  }
}

final class CalendarMonthWeekView: BaseView {
  
  private enum Constants {
    static let range = 0..<7
    static let minimumHeight: CGFloat = 50
  }
  
  override func setupLayout() {
    super.setupLayout()
    rootView.flex
      .direction(.row)
      .justifyContent(.spaceAround)
      .define { flex in
        Constants.range.forEach { _ in
          flex.addItem(CalendarDayView())
            .minHeight(Constants.minimumHeight)
        }
      }
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    rootView.pin.all()
    rootView.flex.layout(mode: .adjustHeight)
  }
}
