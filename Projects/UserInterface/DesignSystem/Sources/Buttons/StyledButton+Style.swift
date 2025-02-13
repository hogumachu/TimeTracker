//
//  StyledButton+Style.swift
//  DesignSystem
//
//  Created by 홍성준 on 2/13/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

extension StyledButton {
  
  public struct Style {
    public let font: UIFont
    public let textColor: UIColor
    public let disabledTextColor: UIColor
    public let backgroundColor: UIColor
    public let disabledBackgroundColor: UIColor
    public let highlightedOverlayColor: UIColor
    public let cornerRadius: CGFloat
    public let cornerCurve: CALayerCornerCurve
    public let borderColor: UIColor
    public let borderWidth: CGFloat
    
    public init(
      font: UIFont,
      textColor: UIColor,
      disabledTextColor: UIColor,
      backgroundColor: UIColor,
      disabledBackgroundColor: UIColor,
      highlightedOverlayColor: UIColor = .label.withAlphaComponent(0.1),
      cornerRadius: CGFloat,
      cornerCurve: CALayerCornerCurve = .continuous,
      borderColor: UIColor = .clear,
      borderWidth: CGFloat = 0
    ) {
      self.font = font
      self.textColor = textColor
      self.disabledTextColor = disabledTextColor
      self.backgroundColor = backgroundColor
      self.disabledBackgroundColor = disabledBackgroundColor
      self.highlightedOverlayColor = highlightedOverlayColor
      self.cornerRadius = cornerRadius
      self.cornerCurve = cornerCurve
      self.borderColor = borderColor
      self.borderWidth = borderWidth
    }
    
    public func updating(
      font: UIFont? = nil,
      textColor: UIColor? = nil,
      disabledTextColor: UIColor? = nil,
      backgroundColor: UIColor? = nil,
      disabledBackgroundColor: UIColor? = nil,
      highlightedOverlayColor: UIColor? = nil,
      cornerRadius: CGFloat? = nil,
      cornerCurve: CALayerCornerCurve? = nil,
      borderColor: UIColor? = nil,
      borderWidth: CGFloat? = nil
    ) -> Style {
      return .init(
        font: font ?? self.font,
        textColor: textColor ?? self.textColor,
        disabledTextColor: disabledTextColor ?? self.disabledTextColor,
        backgroundColor: backgroundColor ?? self.backgroundColor,
        disabledBackgroundColor: disabledBackgroundColor ?? self.disabledBackgroundColor,
        highlightedOverlayColor: highlightedOverlayColor ?? self.highlightedOverlayColor,
        cornerRadius: cornerRadius ?? self.cornerRadius,
        cornerCurve: cornerCurve ?? self.cornerCurve,
        borderColor: borderColor ?? self.borderColor,
        borderWidth: borderWidth ?? self.borderWidth
      )
    }
  }
}
