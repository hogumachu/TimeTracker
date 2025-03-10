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
}

// MARK: - CalendarInteractor

final class CalendarInteractor:
  PresentableInteractor<CalendarPresentable>,
  CalendarInteractable,
  CalendarPresentableListener {

  weak var router: CalendarRouting?
  weak var listener: CalendarListener?
  
  // TODO: - raw value vs. observable
  private(set) var startDate: Date = .now.addingTimeInterval(-360000000)
  private(set) var endDate: Date = .now.addingTimeInterval(360000000)
  private var models: [CalendarDayModel] = []
  
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
    
  }
  
  private func initialized() {
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
  }
  
  private func dateUpdated() {
    presenter.dateUpdated()
  }
}
