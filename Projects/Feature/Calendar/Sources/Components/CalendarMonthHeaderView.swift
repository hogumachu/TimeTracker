//
//  CalendarMonthHeaderView.swift
//  Calendar
//
//  Created by 홍성준 on 3/11/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

import DesignSystem

import FlexLayout
import PinLayout
import Platform
import SwiftDate
import Then

final class CalendarMonthHeaderView: BaseView {
  
  private let monthLabel = UILabel().with {
    $0.font = DesignSystem.Typography.subtitle1
    $0.textColor = DesignSystem.TextColor.primary
  }
  
  func configure(_ title: String) {
    monthLabel.text = title
    monthLabel.flex.markDirty()
    setNeedsLayout()
  }
  
  override func setupLayout() {
    super.setupLayout()
    rootView.backgroundColor = DesignSystem.BackgroundColor.groupedBase
    rootView.flex.define {
      $0.addItem(monthLabel)
        .marginHorizontal(16)
        .grow(1)
      $0.addItem()
        .marginVertical(8)
        .direction(.row)
        .justifyContent(.spaceAround)
        .define { flex in
          Weekday.allCases.forEach {
            flex.addItem(makeWeekdayLabel(weekday: $0))
          }
        }
      $0.addItem()
        .backgroundColor(DesignSystem.BorderColor.basic1)
        .height(1)
        .width(100%)
    }
  }
  
  private func makeWeekdayLabel(weekday: Weekday) -> UILabel {
    return UILabel().with {
      $0.text = weekday.title
      $0.textColor = weekday.color
      $0.font = DesignSystem.Typography.caption1
    }
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    rootView.pin.all()
    rootView.flex.layout()
  }
}

private extension Weekday {
  
  var title: String {
    switch self {
    case .sunday: "일"
    case .monday: "월"
    case .tuesday: "화"
    case .wednesday: "수"
    case .thursday: "목"
    case .friday: "금"
    case .saturday: "토"
    }
  }
  
  var color: UIColor {
    return self == .sunday ? DesignSystem.SubColor.red100 : DesignSystem.TextColor.primary
  }
}
