//
//  CalendarDayCell.swift
//  DesignSystem
//
//  Created by 홍성준 on 2/27/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

import Entity

import FlexLayout
import JTAppleCalendar
import PinLayout
import Then

public struct CalendarDayCellModel: Equatable {
  public let day: Int
  public let date: Date
  public let isSelected: Bool
  public let items: [CalendarDayCellComponentItem]
  
  public init(day: Int, date: Date, isSelected: Bool, items: [CalendarDayCellComponentItem]) {
    self.day = day
    self.date = date
    self.isSelected = isSelected
    self.items = items
  }
}

open class CalendarDayCell: JTACDayCell {
  
  private let dayLabel = UILabel().with {
    $0.font = DesignSystem.Typography.caption1
    $0.textColor = DesignSystem.TextColor.primary
  }
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    setupLayout()
  }
  
  @available(*, unavailable)
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  open override func prepareForReuse() {
    super.prepareForReuse()
    dayLabel.do {
      $0.text = ""
      $0.textColor = DesignSystem.TextColor.primary
      $0.font = DesignSystem.Typography.caption1
    }
  }
  
  open func configure(_ model: CalendarDayCellModel) {
    dayLabel.do {
      $0.text = "\(model.day)"
      $0.flex.markDirty()
    }
    
    setNeedsLayout()
  }
  
  private func setupLayout() {
    contentView.backgroundColor = DesignSystem.BackgroundColor.base
    contentView.flex
      .justifyContent(.center)
      .alignContent(.center)
      .define {
        $0.addItem(dayLabel)
      }
  }
    
  open override func layoutSubviews() {
    super.layoutSubviews()
    contentView.flex.layout(mode: .adjustHeight)
  }
  
  open override func sizeThatFits(_ size: CGSize) -> CGSize {
    contentView.pin.width(size.width)
    contentView.flex.layout(mode: .adjustHeight)
    return contentView.frame.size
  }
}
