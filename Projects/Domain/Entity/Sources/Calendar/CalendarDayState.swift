//
//  CalendarDayState.swift
//  Entity
//
//  Created by 홍성준 on 2/13/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import Foundation

public enum CalendarDayState: Equatable, Sendable, Hashable {
  /// 평일
  case weekday
  /// 주말
  case weekend
  /// 비활성, 현재에 범위를 넘어가는 경우에 해당
  case inactive
}
