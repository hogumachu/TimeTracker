//
//  CalendarMonthLabel.swift
//  Calendar
//
//  Created by sungjun.hong on 3/13/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

import HorizonCalendar

struct CalendarMonthLabel: CalendarItemViewRepresentable {

  /// Properties that are set once when we initialize the view.
  struct InvariantViewProperties: Hashable {
    let font: UIFont
    let textColor: UIColor
    let backgroundColor: UIColor
  }

  /// Properties that will vary depending on the particular date being displayed.
  struct Content: Equatable {
    let month: MonthComponents
  }

  static func makeView(
    withInvariantViewProperties invariantViewProperties: InvariantViewProperties
  ) -> UILabel {
    let label = UILabel()
    label.font = invariantViewProperties.font
    label.textColor = invariantViewProperties.textColor
    label.backgroundColor = invariantViewProperties.backgroundColor
    label.textAlignment = .left
    label.clipsToBounds = true
    return label
  }

  static func setContent(_ content: Content, on view: UILabel) {
    view.text = content.month.description
  }
}
