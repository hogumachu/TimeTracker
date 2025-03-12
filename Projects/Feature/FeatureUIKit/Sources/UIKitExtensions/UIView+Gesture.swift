//
//  UIView+Gesture.swift
//  FeatureUIKit
//
//  Created by 홍성준 on 3/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

public extension UIView {
  
  func addTapGesture() -> UITapGestureRecognizer {
    let gesture = UITapGestureRecognizer()
    isUserInteractionEnabled = true
    addGestureRecognizer(gesture)
    return gesture
  }
}
