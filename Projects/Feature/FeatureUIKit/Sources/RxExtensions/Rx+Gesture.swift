//
//  Rx+Gesture.swift
//  FeatureUIKit
//
//  Created by 홍성준 on 3/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

public extension Reactive where Base: UIView {
  
  var recongnizedTap: ControlEvent<Void> {
    let source = base.addTapGesture().rx.event
      .filter { $0.state == .recognized }
      .map { _ in () }
    return ControlEvent(events: source)
  }
}
