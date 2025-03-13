//
//  CalendarDayLabel.swift
//  Calendar
//
//  Created by sungjun.hong on 3/13/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

import HorizonCalendar

struct CalendarDayLabel: CalendarItemViewRepresentable {

  /// Properties that are set once when we initialize the view.
  struct InvariantViewProperties: Hashable {
    let font: UIFont
    let textColor: UIColor
    let borderColor: UIColor
  }

  /// Properties that will vary depending on the particular date being displayed.
  struct Content: Equatable {
    let day: DayComponents
  }

  static func makeView(
    withInvariantViewProperties invariantViewProperties: InvariantViewProperties
  ) -> UILabel {
    let label = UILabel()
    
    label.isUserInteractionEnabled = true
    label.layer.borderWidth = 1
    label.layer.borderColor = invariantViewProperties.borderColor.cgColor
    label.font = invariantViewProperties.font
    label.textColor = invariantViewProperties.textColor

    label.textAlignment = .center
    label.clipsToBounds = true
    label.layer.cornerRadius = 12
    
    return label
  }

  static func setContent(_ content: Content, on view: UILabel) {
    view.text = "\(content.day.day)"
  }
}
