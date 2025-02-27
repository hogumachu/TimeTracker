//
//  CalendarHeaderView.swift
//  DesignSystem
//
//  Created by 홍성준 on 2/14/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

import FlexLayout
import PinLayout
import Then

struct CalendarHeaderViewModel {
  let title: String
}

final class CalendarHeaderView: BaseView {
  
  private let rootView = UIView().with {
    $0.backgroundColor = DesignSystem.BackgroundColor.base
  }
  
  private let label = UILabel().with {
    $0.text = "2025년 02월"
  }
  
  override func setupLayout() {
    super.setupLayout()
    addSubview(rootView)
    rootView.flex
      .justifyContent(.center)
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
