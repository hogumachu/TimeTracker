//
//  CalendarInteractor.swift
//  Calendar
//
//  Created by 홍성준 on 2/13/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import Foundation

import RIBs
import RxSwift
import SwiftDate

import CalendarInterface
import CalendarServiceInterface
import Entity
import Platform

// MARK: - CalendarPresentable

protocol CalendarPresentable: Presentable {
  var listener: CalendarPresentableListener? { get set }
}

// MARK: - CalendarInteractor

final class CalendarInteractor:
  PresentableInteractor<CalendarPresentable>,
  CalendarInteractable,
  CalendarPresentableListener {

  weak var router: CalendarRouting?
  weak var listener: CalendarListener?
  
  var monthTitle: Observable<String> { monthTitleSubject.asObservable() }
  
  private var items: [CalendarDayItem] = []
  private let monthTitleSubject = BehaviorSubject<String>(value: "")
  
  private let calendarService: CalendarServicable

  init(
    presenter: CalendarPresentable,
    calendarService: CalendarServicable
  ) {
    self.calendarService = calendarService
    super.init(presenter: presenter)
    presenter.listener = self
  }
  
  override func didBecomeActive() {
    super.didBecomeActive()
    initialized()
  }
  
  func didSelectHeader() {
    
  }
  
  func didSelectSearch() {
    
  }
  
  func didSelectNotification() {
    
  }
  
  private func initialized() {
    calendarService.focusedDate
      .subscribe(with: self) { this, date in
        this.monthTitleSubject.onNext(date.toFormat("yyyy년 M월"))
      }
      .disposeOnDeactivate(interactor: self)
    
    calendarService.items
      .subscribe(with: self) { this, items in
        this.items = items
      }
      .disposeOnDeactivate(interactor: self)
  }
  
  private func dateUpdated() {
//    presenter.dateUpdated()
  }
}

extension CalendarInteractor {
  func calendarDetailDidTapClose() {
    router?.detachDetail()
  }
}
