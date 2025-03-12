//
//  CalendarDayView.swift
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

struct CalendarDayViewModel: Equatable {
  let day: Int
  let date: Date
  let isSelected: Bool
  let isInVisiableMonth: Bool
}

final class CalendarDayView: BaseView {
  
  private let dayLabel = UILabel().with {
    $0.font = DesignSystem.Typography.caption1
    $0.textColor = DesignSystem.TextColor.primary
    $0.textAlignment = .center
  }
  
  override func setupLayout() {
    super.setupLayout()
    rootView.flex
      .alignItems(.center)
      .define {
        $0.addItem(dayLabel)
      }
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    rootView.pin.all()
    rootView.flex.layout()
  }
}
