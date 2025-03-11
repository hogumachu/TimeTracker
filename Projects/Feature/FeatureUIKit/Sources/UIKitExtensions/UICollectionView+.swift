//
//  UICollectionView+.swift
//  FeatureKit
//
//  Created by 홍성준 on 2/14/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

extension UICollectionView {
  
  public func register<T: UICollectionViewCell>(_ type: T.Type) {
    register(type.self, forCellWithReuseIdentifier: String(describing: type))
  }
  
  public func dequeueCell<T: UICollectionViewCell>(type: T.Type, for indexPath: IndexPath) -> T {
    guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: type), for: indexPath) as? T else {
      preconditionFailure("Could not dequeue cell with type \(String(describing: type))")
    }
    return cell
  }
}
