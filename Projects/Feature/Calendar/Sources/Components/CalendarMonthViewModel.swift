//
//  CalendarMonthViewModel.swift
//  Calendar
//
//  Created by 홍성준 on 3/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import Foundation

struct CalendarMonthViewModel: Equatable {
  let sections: [CalendarMonthSection]
}

struct CalendarMonthSection: Equatable {
  let dayModel: CalendarDayViewModel
}
