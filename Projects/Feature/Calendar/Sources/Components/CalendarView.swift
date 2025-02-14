//
//  CalendarView.swift
//  CalendarInterface
//
//  Created by 홍성준 on 2/14/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

import FlexLayout
import PinLayout
import Then

import CalendarUIKit
import DesignSystem
import FeatureKit

final class CalendarView: BaseView {
  
  //  let collectionView = UICollectionView(frame: .zero).with {
  //    $0.register(CalendarCollectionViewCell.self)
  //  }
  
  let rootView = BaseView()
  
  let button = StyledButton(style: .largeFillBlue).with {
    $0.setTitle("상세", for: .normal)
  }
  
  override func setupLayout() {
    super.setupLayout()
    addSubview(rootView)
    rootView.flex
      .justifyContent(.center)
      .alignItems(.center)
      .define {
        $0.addItem(button)
      }
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    rootView.pin.all()
    rootView.flex.layout()
  }
  
}
