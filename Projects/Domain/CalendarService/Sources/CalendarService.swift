//
//  CalendarService.swift
//  CalendarServiceInterface
//
//  Created by 홍성준 on 2/13/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import Foundation

import SwiftDate
import RxSwift

import CalendarServiceInterface

public final class CalendarService: CalendarServicable {
  
  public var focusedDate: Observable<Date> { _focusedDate.asObservable() }
  private let _focusedDate: BehaviorSubject<Date>
  
  public var selectedDays: Observable<ClosedRange<Date>?> { _selectedDays.asObservable() }
  private let _selectedDays: BehaviorSubject<ClosedRange<Date>?> = .init(value: nil)
  
  public var startDate: Observable<Date> { _startDate.asObservable() }
  private let _startDate: BehaviorSubject<Date>
  
  public var endDate: Observable<Date> { _endDate.asObservable() }
  private let _endDate: BehaviorSubject<Date>
  
  public init(focusedDate: Date) {
    _focusedDate = .init(value: focusedDate)
    _startDate = .init(value: focusedDate - 1.years)
    _endDate = .init(value: focusedDate + 1.years)
  }
}
