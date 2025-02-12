//
//  DynamicColorable.swift
//  DesignSystem
//
//  Created by sungjun.hong on 2/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

public protocol DynamicColorable: Sendable {
  var dynamic: UIColor { get }
  var light: UIColor { get }
  var dark: UIColor { get }
}

extension DynamicColorable {
  public var dynamic: UIColor {
    UIColor { $0.userInterfaceStyle == .light ? light : dark }
  }
}
