//
//  DesignSystem+StyledButton.swift
//  DesignSystem
//
//  Created by 홍성준 on 2/13/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

extension StyledButton.Style {
  
  // MARK: - Large
  
  public static let largeFillBlue = Self(
    font: DesignSystem.Typography.subtitle1,
    textColor: .white,
    disabledTextColor: DesignSystem.GrayColor.gray500,
    backgroundColor: DesignSystem.TintColor.blue500,
    disabledBackgroundColor: DesignSystem.GrayColor.gray400,
    cornerRadius: 16
  )
  
  public static let largeFillGray = largeFillBlue.updating(
    backgroundColor: .init(hex: "#28323C")
  )
  
  public static let largeFillCoral = largeFillBlue.updating(
    backgroundColor: DesignSystem.TintColor.coral500
  )
  
  // MARK: - Regular
  
  public static let regularFillBlue = Self(
    font: DesignSystem.Typography.body1,
    textColor: .white,
    disabledTextColor: DesignSystem.GrayColor.gray500,
    backgroundColor: DesignSystem.TintColor.blue500,
    disabledBackgroundColor: DesignSystem.GrayColor.gray400,
    cornerRadius: 8
  )
  
  public static let regularFillGray = regularFillBlue.updating(
    backgroundColor: .init(hex: "#28323C")
  )
  
  public static let regularFillCoral = regularFillBlue.updating(
    backgroundColor: DesignSystem.TintColor.coral500
  )
  
  public static let regularLineBlue = Self(
    font: DesignSystem.Typography.body1,
    textColor: DesignSystem.TintColor.blue700,
    disabledTextColor: DesignSystem.GrayColor.gray500,
    backgroundColor: DesignSystem.GrayColor.gray100,
    disabledBackgroundColor: DesignSystem.GrayColor.gray400,
    cornerRadius: 8,
    cornerCurve: .continuous,
    borderColor: DesignSystem.BorderColor.basic1,
    borderWidth: 1
  )
  
  public static let regularLineGray = regularLineBlue.updating(
    textColor: DesignSystem.GrayColor.gray600
  )
  
  public static let regularLineCoral = regularLineBlue.updating(
    textColor: DesignSystem.TintColor.coral700
  )
  
  // MARK: - Small
  
  public static let smallLineGray = Self(
    font: DesignSystem.Typography.caption1,
    textColor: DesignSystem.GrayColor.gray600,
    disabledTextColor: DesignSystem.GrayColor.gray500,
    backgroundColor: DesignSystem.GrayColor.gray100,
    disabledBackgroundColor: DesignSystem.GrayColor.gray400,
    cornerRadius: 4,
    cornerCurve: .continuous,
    borderColor: DesignSystem.BorderColor.basic1,
    borderWidth: 1
  )
  
  public static let smallTextBlue = Self(
    font: DesignSystem.Typography.caption1,
    textColor: DesignSystem.TintColor.blue700,
    disabledTextColor: DesignSystem.GrayColor.gray500,
    backgroundColor: .clear,
    disabledBackgroundColor: .clear,
    cornerRadius: 0
  )
  
  public static let smallTextGray = smallTextBlue.updating(
    textColor: DesignSystem.GrayColor.gray600
  )
}
