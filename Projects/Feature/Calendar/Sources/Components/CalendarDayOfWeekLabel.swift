//
//  CalendarDayOfWeekLabel.swift
//  Calendar
//
//  Created by sungjun.hong on 3/13/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

import HorizonCalendar

struct CalendarDayOfWeekLabel: CalendarItemViewRepresentable {

  /// Properties that are set once when we initialize the view.
  struct InvariantViewProperties: Hashable {
    let font: UIFont
    let backgroundColor: UIColor
  }

  /// Properties that will vary depending on the particular date being displayed.
  struct Content: Equatable {
    let text: String
    let textColor: UIColor
  }

  static func makeView(
    withInvariantViewProperties invariantViewProperties: InvariantViewProperties
  ) -> UILabel {
    let label = UILabel()
    label.font = invariantViewProperties.font
    label.backgroundColor = invariantViewProperties.backgroundColor
    label.textAlignment = .center
    label.clipsToBounds = true
    return label
  }

  static func setContent(_ content: Content, on view: UILabel) {
    view.text = content.text
    view.textColor = content.textColor
  }
}
