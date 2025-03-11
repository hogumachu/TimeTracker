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
  func dateUpdated()
  func scrollToDate(_ date: Date, animated: Bool)
}

// MARK: - CalendarInteractor

final class CalendarInteractor:
  PresentableInteractor<CalendarPresentable>,
  CalendarInteractable,
  CalendarPresentableListener {

  weak var router: CalendarRouting?
  weak var listener: CalendarListener?
  
  var monthTitle: Observable<String> { monthTitleSubject.asObservable() }
  
  // TODO: - raw value vs. observable
  private(set) var startDate: Date?
  private(set) var endDate: Date?
  private var models: [CalendarDayModel] = []
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
  
  func model(at indexPath: IndexPath) -> CalendarDayModel? {
    return models[safe: indexPath.row]
  }
  
  func didSelectHeader() {
    
  }
  
  func didSelectSearch() {
    
  }
  
  func didSelectNotification() {
    
  }
  
  func didSelect(date: Date, indexPath: IndexPath) {
    
  }
  
  func willDisplay(date: Date, indexPath: IndexPath) {
    let title = date.toFormat("yyyy년 M월")
    monthTitleSubject.onNext(title)
  }
  
  private func initialized() {
    calendarService.focusedDate
      .subscribe(with: self) { this, date in
        this.presenter.scrollToDate(date, animated: false)
      }
      .disposeOnDeactivate(interactor: self)
    
    calendarService.startDate
      .subscribe(with: self) { this, startDate in
        this.startDate = startDate
        this.dateUpdated()
      }
      .disposeOnDeactivate(interactor: self)
    
    calendarService.endDate
      .subscribe(with: self) { this, endDate in
        this.endDate = endDate
        this.dateUpdated()
      }
      .disposeOnDeactivate(interactor: self)
    
    calendarService.items
      .subscribe(with: self) { this, items in
        this.models = items.map { .init(item: $0, isSelected: false) }
      }
      .disposeOnDeactivate(interactor: self)
  }
  
  private func dateUpdated() {
    presenter.dateUpdated()
  }
}
