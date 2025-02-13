//
//  RootInteractor.swift
//  TimeTracker
//
//  Created by 홍성준 on 2/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import RIBs
import RxSwift

import AppFoundation
import UserServiceInterface

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
  
  private let userSerivce: UserServicable
  
  init(
    presenter: RootPresentable,
    userSerivce: UserServicable
  ) {
    self.userSerivce = userSerivce
    super.init(presenter: presenter)
    presenter.listener = self
  }
  
  override func didBecomeActive() {
    super.didBecomeActive()
    if userSerivce.onboardingRequired() {
      router?.attachSplash()
    } else {
      router?.attachTabs()
    }
  }
}

// MARK: - Splash

extension RootInteractor {
  func splashCompleted() {
    userSerivce.onboardingCompleted()
    router?.detachSplash()
    router?.attachTabs()
  }
}
