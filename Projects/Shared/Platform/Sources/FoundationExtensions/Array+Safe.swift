//
//  Array+Safe.swift
//  Platform
//
//  Created by 홍성준 on 3/10/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import Foundation

public extension Array {
  
  subscript(safe index: Int) -> Element? {
    return self.indices ~= index ? self[index] : nil
  }
}
