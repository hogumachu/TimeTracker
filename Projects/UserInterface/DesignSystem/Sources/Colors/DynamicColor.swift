//
//  DynamicColor.swift
//  DesignSystem
//
//  Created by sungjun.hong on 2/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

public struct DynamicColor: Sendable {
  public let lightHex: String
  public let darkHex: String
  
  public init(lightHex: String, darkHex: String) {
    self.lightHex = lightHex
    self.darkHex = darkHex
  }
}

extension DynamicColor: DynamicColorable {
  public var light: UIColor { .init(hex: lightHex) }
  public var dark: UIColor { .init(hex: darkHex) }
}
