//
//  TodoItem.swift
//  Entity
//
//  Created by 홍성준 on 3/10/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import Foundation

public struct TodoItem: Equatable {
  public let todo: String
  public let isCompleted: Bool
  public let date: Date
  public let hexColor: String
  
  public init(
    todo: String,
    isCompleted: Bool,
    date: Date,
    hexColor: String
  ) {
    self.todo = todo
    self.isCompleted = isCompleted
    self.date = date
    self.hexColor = hexColor
  }
}
