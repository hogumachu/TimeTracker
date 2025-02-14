//
//  BaseViewController.swift
//  DesignSystem
//
//  Created by 홍성준 on 2/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

open class BaseViewController: UIViewController {
  public init() {
    super.init(nibName: nil, bundle: nil)
    view.backgroundColor = DesignSystem.BackgroundColor.base
  }
  
  @available(*, unavailable)
  public required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
