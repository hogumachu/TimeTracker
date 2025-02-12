//
//  RootInteractor.swift
//  TimeTracker
//
//  Created by 홍성준 on 2/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import AppFoundation
import RIBs
import RxSwift

protocol RootRouting: ViewableRouting {
  func attachTabs()
  func attachSplash()
  func detachSplash()
}

protocol RootPresentable: Presentable {
  var listener: RootPresentableListener? { get set }
}

protocol RootListener: AnyObject {}

final class RootInteractor:
  PresentableInteractor<RootPresentable>,
  RootInteractable,
  RootPresentableListener {
  
  weak var router: RootRouting?
  weak var listener: RootListener?
  
  override init(presenter: RootPresentable) {
    super.init(presenter: presenter)
    presenter.listener = self
  }
  
  override func didBecomeActive() {
    super.didBecomeActive()
    router?.attachSplash()
  }
  
  override func willResignActive() {
    super.willResignActive()
  }
}

// MARK: - Splash

extension RootInteractor {
  func splashCompleted() {
    router?.detachSplash()
    router?.attachTabs()
  }
}
