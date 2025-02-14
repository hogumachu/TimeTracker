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

import CalendarInterface

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

  override init(presenter: CalendarPresentable) {
    super.init(presenter: presenter)
    presenter.listener = self
  }

  override func didBecomeActive() {
    super.didBecomeActive()
  }
  
  override func willResignActive() {
    super.willResignActive()
  }
  
  func detailTapped() {
    router?.attachDetail()
  }
}
