//
//  CalendarServiceInterface.swift
//  CalendarServiceInterface
//
//  Created by 홍성준 on 2/13/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import Foundation

import RxSwift

import Entity

public protocol FocusedDateObservable: AnyObject {
  var focusedDate: Observable<Date> { get }
}

public protocol SelectedDayObservable: AnyObject {
  var selectedDays: Observable<ClosedRange<Date>?> { get }
}

public protocol CalendarServicable: FocusedDateObservable,
                                    SelectedDayObservable {
  var items: Observable<[CalendarDayItem]> { get }
}
