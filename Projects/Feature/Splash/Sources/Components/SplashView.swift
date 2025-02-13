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
import Then

import DesignSystem

final class SplashView: BaseView {
  
  let rootView = UIView().with {
    $0.backgroundColor = DesignSystem.BackgroundColor.base
  }
  let label = UILabel().with {
    $0.text = "Hello, TimeTracker"
    $0.textColor = DesignSystem.TextColor.primary
    $0.font = DesignSystem.Typography.header1
  }
  let button = StyledButton(style: .largeFillBlue).with {
    $0.setTitle("완료", for: .normal)
  }
  
  override func setupLayout() {
    super.setupLayout()
    addSubview(rootView)
    rootView.flex
      .justifyContent(.center)
      .alignItems(.center)
      .define {
        $0.addItem(label)
        $0.addItem(button)
          .position(.absolute)
          .height(50)
          .width(90%)
          .bottom(pin.safeArea.bottom + 16)
      }
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    rootView.pin.all(pin.safeArea)
    rootView.flex.layout()
  }
}
