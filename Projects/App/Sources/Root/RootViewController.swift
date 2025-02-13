//
//  RootViewController.swift
//  TimeTracker
//
//  Created by 홍성준 on 2/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

import RIBs
import RxSwift

import DesignSystem

protocol RootPresentableListener: AnyObject {}

final class RootViewController: UITabBarController,
                                RootPresentable,
                                RootViewControllable {
  
  weak var listener: RootPresentableListener?
  
  init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTabBar()
  }
  
  func setTabs(_ viewControllables: [ViewControllable], animated: Bool) {
    super.setViewControllers(viewControllables.map(\.uiviewController), animated: animated)
    selectedIndex = 0
  }
  
  private func setupTabBar() {
    let appearance: UITabBarAppearance = tabBar.standardAppearance
    appearance.configureWithDefaultBackground()
    appearance.backgroundColor = DesignSystem.BackgroundColor.base
    appearance.stackedItemPositioning = .automatic
    tabBar.isTranslucent = false
    tabBar.barStyle = .default
    tabBar.standardAppearance = appearance
    tabBar.tintColor = DesignSystem.TintColor.blue800
    tabBar.unselectedItemTintColor = DesignSystem.TextColor.placeholder
  }
}
