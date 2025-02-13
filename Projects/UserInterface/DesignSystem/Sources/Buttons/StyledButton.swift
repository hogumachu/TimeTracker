//
//  StyledButton.swift
//  DesignSystem
//
//  Created by 홍성준 on 2/13/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

open class StyledButton: BaseButton {
  
  private let highlightedOverlay = UIView()
  
  open override var isEnabled: Bool {
    didSet {
      updateStyle()
    }
  }
  
  open override var isHighlighted: Bool {
    didSet {
      highlightedOverlay.isHidden = !isHighlighted
    }
  }
  
  public var style: Style {
    didSet {
      updateStyle()
    }
  }
  
  public init(style: Style) {
    self.style = style
    super.init()
    updateStyle()
    setupHiglightedOverlay()
  }
  
  private func setupHiglightedOverlay() {
    highlightedOverlay.isHidden = !isHighlighted
    addSubview(highlightedOverlay)
    highlightedOverlay.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      highlightedOverlay.topAnchor.constraint(equalTo: topAnchor),
      highlightedOverlay.leadingAnchor.constraint(equalTo: leadingAnchor),
      highlightedOverlay.trailingAnchor.constraint(equalTo: trailingAnchor),
      highlightedOverlay.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
  
  private func updateStyle() {
    backgroundColor = isEnabled ? style.backgroundColor : style.disabledBackgroundColor
    titleLabel?.font = style.font
    setTitleColor(style.textColor, for: .normal)
    setTitleColor(style.disabledTextColor, for: .disabled)
    cornerRadius = style.cornerRadius
    cornerCurve = style.cornerCurve
    borderColor = style.borderColor
    borderWidth = style.borderWidth
    highlightedOverlay.backgroundColor = style.highlightedOverlayColor
  }
}
