//
//  HomeDashboardInteractor.swift
//  Home
//
//  Created by 홍성준 on 2/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import Foundation

import RIBs
import RxSwift

import CalendarServiceInterface
import HomeInterface

// MARK: - HomeDashboardPresentable

protocol HomeDashboardPresentable: Presentable {
  var listener: HomeDashboardPresentableListener? { get set }
  func focus(on date: Date)
}

// MARK: - HomeDashboardInteractor

final class HomeDashboardInteractor:
  PresentableInteractor<HomeDashboardPresentable>,
  HomeDashboardInteractable,
  HomeDashboardPresentableListener {
  
  weak var router: HomeDashboardRouting?
  weak var listener: HomeDashboardListener?
  
  private let calendarService: CalendarServicable
  
  init(
    presenter: HomeDashboardPresentable,
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
  
  private func initialized() {
    router?.attachCalendar()
    calendarService.focusedDate
      .subscribe(with: self) { this, date in
        this.presenter.focus(on: date)
      }
      .disposeOnDeactivate(interactor: self)
  }
}
