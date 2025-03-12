//
//  CalendarMonthCell.swift
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

final class CalendarMonthCell: UICollectionViewCell {
  
  private enum Constants {
    static let range = 0..<6
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupLayout()
  }
  
  @available(*, unavailable)
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(_ color: UIColor) {
    contentView.backgroundColor = color
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    contentView.backgroundColor = .clear
  }
  
  private func setupLayout() {
    contentView.backgroundColor = DesignSystem.BackgroundColor.base
    contentView.flex
      .define { flex in
        Constants.range.forEach { _ in
          flex.addItem(CalendarMonthWeekView())
        }
      }
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    contentView.flex.layout(mode: .adjustHeight)
  }
  
  override func sizeThatFits(_ size: CGSize) -> CGSize {
    contentView.pin.width(size.width)
    contentView.flex.layout(mode: .adjustHeight)
    return contentView.frame.size
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
