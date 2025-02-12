//
//  SplashView.swift
//  SplashInterface
//
//  Created by 홍성준 on 2/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

import FlexLayout
import PinLayout

import DesignSystem

final class SplashView: BaseView {
  
  private let rootView = UIView()
  private let label = UILabel()
  
  override func setupLayout() {
    super.setupLayout()
    addSubview(rootView)
    rootView.backgroundColor = DesignSystem.BackgroundColor.base
    label.text = "Hello, TimeTracker"
    label.textColor = DesignSystem.TextColor.primary
    label.font = DesignSystem.Typography.header1
    rootView.flex
      .alignItems(.center)
      .alignContent(.center)
      .define {
        $0.addItem(label)
      }
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    rootView.pin.all()
    rootView.flex.layout()
  }
}
