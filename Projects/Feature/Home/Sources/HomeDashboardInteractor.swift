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

import HomeInterface

// MARK: - HomeDashboardPresentable

protocol HomeDashboardPresentable: Presentable {
  var listener: HomeDashboardPresentableListener? { get set }
}

// MARK: - HomeDashboardInteractor

final class HomeDashboardInteractor:
  PresentableInteractor<HomeDashboardPresentable>,
  HomeDashboardInteractable,
  HomeDashboardPresentableListener {

  weak var router: HomeDashboardRouting?
  weak var listener: HomeDashboardListener?

  override init(presenter: HomeDashboardPresentable) {
    super.init(presenter: presenter)
    presenter.listener = self
  }

  override func didBecomeActive() {
    super.didBecomeActive()
  }
  
  override func willResignActive() {
    super.willResignActive()
  }
}
