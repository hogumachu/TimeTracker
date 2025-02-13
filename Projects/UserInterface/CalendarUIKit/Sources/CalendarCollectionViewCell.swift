//
//  CalendarCollectionViewCell.swift
//  CalendarUIKit
//
//  Created by 홍성준 on 2/13/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

import FlexLayout
import PinLayout
import Then

import DesignSystem
import Entity

open class CalendarCollectionViewCell: UICollectionViewCell {
  
  private enum Constants {
    static let weekDayTextColor = DesignSystem.TextColor.primary
    static let weekendTextColor = DesignSystem.SubColor.red100
    static let inactiveTextColor = DesignSystem.TextColor.disabled
    static let font = DesignSystem.Typography.caption1
  }
  
  public let rootView = BaseView()
  public let dayLabel = UILabel().with {
    $0.textColor = Constants.inactiveTextColor
    $0.font = Constants.font
    $0.numberOfLines = 1
  }
  
  public init() {
    super.init(frame: .zero)
    setupLayout()
  }
  
  @available(*, unavailable)
  public required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  open override func prepareForReuse() {
    super.prepareForReuse()
    dayLabel.textColor = Constants.inactiveTextColor
  }
  
  public final func configure(_ model: CalendarCollectionViewCellModel) {
    updateDayLabel(model: model)
  }
  
  open func setupLayout() {
    contentView.addSubview(rootView)
    rootView.flex
      .alignItems(.center)
      .define {
        $0.addItem(dayLabel)
      }
  }
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    rootView.pin.all()
    rootView.flex.layout()
  }
  
  private func updateDayLabel(model: CalendarCollectionViewCellModel) {
    dayLabel.text = "\(model.date)"
    switch model.dayState {
    case .weekday:
      dayLabel.textColor = Constants.weekDayTextColor
      
    case .weekend:
      dayLabel.textColor = Constants.weekendTextColor
      
    case .inactive:
      dayLabel.textColor = Constants.inactiveTextColor
    }
  }
}
