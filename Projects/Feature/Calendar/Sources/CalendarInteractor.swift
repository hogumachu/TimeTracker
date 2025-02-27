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
  
  private(set) var startDate: Date = .now
  private(set) var endDate: Date = .now
  
  private let calendarService: CalendarServicable

  init(
    presenter: CalendarPresentable,
    calendarService: CalendarServicable
  ) {
    self.calendarService = calendarService
    super.init(presenter: presenter)
    presenter.listener = self
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
}
