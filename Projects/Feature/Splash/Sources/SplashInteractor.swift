//
//  SplashInteractor.swift
//  Splash
//
//  Created by 홍성준 on 2/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import Foundation
import RIBs
import RxSwift
import SplashInterface

// MARK: - SplashPresentable

protocol SplashPresentable: Presentable {
  var listener: SplashPresentableListener? { get set }
}

// MARK: - SplashInteractor

final class SplashInteractor:
  PresentableInteractor<SplashPresentable>,
  SplashInteractable {
  
  weak var router: SplashRouting?
  weak var listener: SplashListener?
  
  override init(presenter: SplashPresentable) {
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

// MARK: - Presenter

extension SplashInteractor: SplashPresentableListener {
  func completeTapped() {
    listener?.splashCompleted()
  }
}
