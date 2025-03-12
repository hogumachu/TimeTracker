//
//  BaseView.swift
//  DesignSystem
//
//  Created by 홍성준 on 2/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

import Then

open class BaseView: UIView {
  
  public let rootView = UIView().with {
    $0.backgroundColor = DesignSystem.BackgroundColor.base
  }
  
  public init() {
    super.init(frame: .zero)
    setupLayout()
  }
  
  @available(*, unavailable)
  public required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  open func setupLayout() {
    addSubview(rootView)
  }
}
