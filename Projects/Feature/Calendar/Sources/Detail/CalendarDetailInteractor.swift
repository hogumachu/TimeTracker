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
  
  override init(presenter: CalendarDetailPresentable) {
    super.init(presenter: presenter)
    presenter.listener = self
  }
}
