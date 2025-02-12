//
//  SplashViewController.swift
//  Splash
//
//  Created by 홍성준 on 2/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import DesignSystem
import RIBs
import RxSwift
import UIKit

protocol SplashPresentableListener: AnyObject {
  func completeTapped()
}

final class SplashViewController:
  BaseViewController,
  SplashPresentable,
  SplashViewControllable {
  
  weak var listener: SplashPresentableListener?
  
  private let contentView = SplashView()
  
  override init() {
    super.init()
    modalPresentationStyle = .fullScreen
    modalTransitionStyle = .crossDissolve
  }
  
  override func loadView() {
    view = contentView
  }
  
  private func setupLayout() {
    
  }
  
  private func setupAttributes() {
    
  }
}
