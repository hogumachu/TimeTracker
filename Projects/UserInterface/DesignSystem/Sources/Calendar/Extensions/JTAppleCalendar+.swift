//
//  JTAppleCalendar+.swift
//  DesignSystem
//
//  Created by 홍성준 on 3/11/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

import JTAppleCalendar

public extension JTACMonthView {
  
  func registerReusableMonthView<T: JTACMonthReusableView>(_ type: T.Type) {
    register(
      type.self,
      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
      withReuseIdentifier: String(describing: type)
    )
  }
  
  func dequeueReusableMonthView<T: JTACMonthReusableView>(type: T.Type, for indexPath: IndexPath) -> T {
    guard let view = dequeueReusableJTAppleSupplementaryView(withReuseIdentifier: String(describing: self), for: indexPath) as? T else {
      preconditionFailure("Could not dequeue reusable view with type \(String(describing: type))")
    }
    return view
  }
}
