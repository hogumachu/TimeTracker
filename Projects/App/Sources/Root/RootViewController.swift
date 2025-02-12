//
//  RootViewController.swift
//  TimeTracker
//
//  Created by 홍성준 on 2/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol RootPresentableListener: AnyObject {}

final class RootViewController: UITabBarController, RootPresentable, RootViewControllable {
  
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
  }
}
