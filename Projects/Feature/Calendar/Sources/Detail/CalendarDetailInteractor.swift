//
//  CalendarDetailInteractor.swift
//  Calendar
//
//  Created by 홍성준 on 2/14/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import Foundation

import RIBs
import RxSwift
import SwiftDate

// MARK: - CalendarDetailPresentable

protocol CalendarDetailPresentable: Presentable {
  var listener: CalendarDetailPresentableListener? { get set }
}

// MARK: - CalendarDetailInteractor

final class CalendarDetailInteractor:
  PresentableInteractor<CalendarDetailPresentable>,
  CalendarDetailInteractable,
  CalendarDetailPresentableListener {
  
  weak var router: CalendarDetailRouting?
  weak var listener: CalendarDetailListener?
  
  var title: Observable<String> { titleSubject.asObservable() }
  private lazy var titleSubject = BehaviorSubject(value: date.toFormat("M월 d일 E요일"))
  
  private let date: Date
  
  init(
    presenter: CalendarDetailPresentable,
    date: Date
  ) {
    self.date = date
    super.init(presenter: presenter)
    presenter.listener = self
  }
  
  func backgroundTapped() {
    listener?.calendarDetailDidTapClose()
  }
}
