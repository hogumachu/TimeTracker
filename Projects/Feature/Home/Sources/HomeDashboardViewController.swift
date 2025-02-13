//
//  HomeDashboardViewController.swift
//  Home
//
//  Created by 홍성준 on 2/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

import RIBs
import RxSwift
import Then

import DesignSystem

protocol HomeDashboardPresentableListener: AnyObject {}

final class HomeDashboardViewController:
  BaseViewController,
  HomeDashboardViewControllable {
  
  private enum Constants {
    static let tabBarTitle = "홈"
  }
  
  weak var listener: HomeDashboardPresentableListener?
  
  override init() {
    super.init()
    setupTabBar()
  }
  
  // TODO: - Add tab bar images
  
  private func setupTabBar() {
    tabBarItem = .init(
      title: Constants.tabBarTitle,
      image: nil,
      selectedImage: nil
    )
  }
  
}

extension HomeDashboardViewController: HomeDashboardPresentable {
  
  func setViewController(_ viewControllable: ViewControllable) {
    let viewController = viewControllable.uiviewController
    addChild(viewController)
    viewController.view.do {
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        $0.topAnchor.constraint(equalTo: view.topAnchor),
        $0.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        $0.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        $0.bottomAnchor.constraint(equalTo: view.bottomAnchor)
      ])
    }
    viewController.didMove(toParent: self)
  }
  
  func focus(on date: Date) {
    // TODO: - Date에 초점 이동
  }
}
