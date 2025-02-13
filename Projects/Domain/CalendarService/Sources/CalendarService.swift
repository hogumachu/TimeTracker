//
//  CalendarService.swift
//  CalendarServiceInterface
//
//  Created by 홍성준 on 2/13/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import Foundation

import RxSwift

import CalendarServiceInterface

public final class CalendarService: CalendarServicable {
  
  public var focusedDate: Observable<Date> {
    _focusedDate.asObservable()
  }
  private let _focusedDate: BehaviorSubject<Date>
  
  public init(focusedDate: Date) {
    _focusedDate = .init(value: focusedDate)
  }
}
