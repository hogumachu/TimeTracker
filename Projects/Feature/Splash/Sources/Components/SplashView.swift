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
  
  override func setupLayout() {
    super.setupLayout()
    addSubview(rootView)
    rootView.backgroundColor = .red
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    rootView.pin.all()
    rootView.flex.layout()
  }
}
