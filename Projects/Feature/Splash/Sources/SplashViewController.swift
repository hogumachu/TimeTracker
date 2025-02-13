//
//  SplashViewController.swift
//  Splash
//
//  Created by 홍성준 on 2/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

import RIBs
import RxSwift
import RxCocoa

import DesignSystem

protocol SplashPresentableListener: AnyObject {
  func completeTapped()
}

final class SplashViewController:
  BaseViewController,
  SplashPresentable,
  SplashViewControllable {
  
  weak var listener: SplashPresentableListener?
  
  private let contentView = SplashView()
  private let disposeBag = DisposeBag()
  
  override init() {
    super.init()
    modalPresentationStyle = .fullScreen
    modalTransitionStyle = .crossDissolve
    bind()
  }
  
  override func loadView() {
    view = contentView
  }
  
  private func bind() {
    contentView.button.rx.tap
      .bind(with: self) { this, _ in
        this.listener?.completeTapped()
      }
      .disposed(by: disposeBag)
  }
}
