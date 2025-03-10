//
//  ScheduleItem.swift
//  Entity
//
//  Created by 홍성준 on 3/10/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import Foundation

public struct ScheduleItem: Equatable {
  public let title: String
  public let date: Date
  public let hexColor: String
  
  public init(
    title: String,
    date: Date,
    hexColor: String
  ) {
    self.title = title
    self.date = date
    self.hexColor = hexColor
  }
}
