//
//  CalendarCollectionViewCellModel.swift
//  CalendarUIKit
//
//  Created by 홍성준 on 2/13/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import Foundation

import Entity

// TODO: - Calendar에 필요한 값들 추가하기

public struct CalendarCollectionViewCellModel: Equatable {
  public let date: Date
  public let dayState: CalendarDayState
  
  public init(
    date: Date,
    dayState: CalendarDayState
  ) {
    self.date = date
    self.dayState = dayState
  }
}
