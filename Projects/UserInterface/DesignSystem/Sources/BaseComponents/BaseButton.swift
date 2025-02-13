//
//  BaseButton.swift
//  DesignSystem
//
//  Created by 홍성준 on 2/13/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

open class BaseButton: UIButton {
  
  public var cornerRadius: CGFloat = 0 {
    didSet {
      layer.cornerRadius = cornerRadius
      setNeedsLayout()
    }
  }
  
  public var cornerCurve: CALayerCornerCurve = .continuous {
    didSet {
      layer.cornerCurve = cornerCurve
      setNeedsLayout()
    }
  }
  
  public var borderColor: UIColor = .clear {
    didSet {
      layer.borderColor = borderColor.cgColor
      setNeedsLayout()
    }
  }
  
  public var borderWidth: CGFloat = .zero {
    didSet {
      layer.borderWidth = borderWidth
      setNeedsLayout()
    }
  }
  
  public init() {
    super.init(frame: .zero)
    clipsToBounds = true
  }
  
  @available(*, unavailable)
  public required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    traitCollection.performAsCurrent {
      layer.borderColor = borderColor.cgColor
    }
  }
}
