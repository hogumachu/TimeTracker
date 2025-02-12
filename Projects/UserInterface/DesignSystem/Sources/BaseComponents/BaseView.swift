//
//  BaseView.swift
//  DesignSystem
//
//  Created by 홍성준 on 2/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

open class BaseView: UIView {
  
  public init() {
    super.init(frame: .zero)
    setupLayout()
  }
  
  @available(*, unavailable)
  public required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  open func setupLayout() {}
}
