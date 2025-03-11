//
//  Weekday.swift
//  Platform
//
//  Created by 홍성준 on 3/11/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import Foundation

public enum Weekday: String, Sendable, CaseIterable {
  case sunday
  case monday
  case tuesday
  case wednesday
  case thursday
  case friday
  case saturday
}

public extension Weekday {
  
  func toLocale() -> Locale.Weekday {
    switch self {
    case .sunday: .sunday
    case .monday: .monday
    case .tuesday: .tuesday
    case .wednesday: .wednesday
    case .thursday: .thursday
    case .friday: .friday
    case .saturday: .saturday
    }
  }
  
  func toUnit() -> Int {
    switch self {
    case .sunday: 1
    case .monday: 2
    case .tuesday: 3
    case .wednesday: 4
    case .thursday: 5
    case .friday: 6
    case .saturday: 7
    }
  }
}
