//
//  DesignSystem+Color.swift
//  DesignSystem
//
//  Created by sungjun.hong on 2/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

extension DesignSystem {
  
  // MARK: - Tint
  
  public enum TintColor {
    
    // MARK: - Blue
    
    public static let blue100 = DynamicColor(lightHex: "#E1F5FF", darkHex: "#0077C8").dynamic
    public static let blue200 = DynamicColor(lightHex: "#B2E5FF", darkHex: "#0088DC").dynamic
    public static let blue300 = DynamicColor(lightHex: "#7DD5FF", darkHex: "#00A9FF").dynamic
    public static let blue400 = DynamicColor(lightHex: "#44C4FF", darkHex: "#00B7FF").dynamic
    public static let blue500 = DynamicColor(lightHex: "#00B8FF", darkHex: "#00C3FF").dynamic
    public static let blue600 = DynamicColor(lightHex: "#00AAFE", darkHex: "#6FD4FF").dynamic
    public static let blue700 = DynamicColor(lightHex: "#009BEF", darkHex: "#ACE5FF").dynamic
    public static let blue800 = DynamicColor(lightHex: "#0088DA", darkHex: "#DEF5FF").dynamic
    
    // MARK: - Coral
    
    public static let coral100 = DynamicColor(lightHex: "#FFEEF1", darkHex: "#D73F2F").dynamic
    public static let coral200 = DynamicColor(lightHex: "#FFD5D9", darkHex: "#E44636").dynamic
    public static let coral300 = DynamicColor(lightHex: "#F8A8A5", darkHex: "#F7503C").dynamic
    public static let coral400 = DynamicColor(lightHex: "#F28882", darkHex: "#FF583B").dynamic
    public static let coral500 = DynamicColor(lightHex: "#FF6F61", darkHex: "#FF6557").dynamic
    public static let coral600 = DynamicColor(lightHex: "#FF6247", darkHex: "#F3817B").dynamic
    public static let coral700 = DynamicColor(lightHex: "#F75B48", darkHex: "#F9A4A0").dynamic
    public static let coral800 = DynamicColor(lightHex: "#E45141", darkHex: "#FFD3D6").dynamic
  }
  
  // MARK: - Gray
  
  public enum GrayColor {
    public static let gray100 = DynamicColor(lightHex: "#FEFEFE", darkHex: "#171B1C").dynamic
    public static let gray200 = DynamicColor(lightHex: "#FDFDFD", darkHex: "#1E2427").dynamic
    public static let gray300 = DynamicColor(lightHex: "#F7F8F9", darkHex: "#2E363A").dynamic
    public static let gray400 = DynamicColor(lightHex: "#E9EBEE", darkHex: "#41474C").dynamic
    public static let gray500 = DynamicColor(lightHex: "#C5C8CE", darkHex: "#5A6166").dynamic
    public static let gray600 = DynamicColor(lightHex: "#646F7C", darkHex: "#999FA4").dynamic
    public static let gray700 = DynamicColor(lightHex: "#384553", darkHex: "#C5C8CE").dynamic
    public static let gray800 = DynamicColor(lightHex: "#28323C", darkHex: "#F7F8F9").dynamic
    public static let gray900 = DynamicColor(lightHex: "#161D24", darkHex: "#FDFDFD").dynamic
  }
  
  // MARK: - Background
  
  public enum BackgroundColor {
    public static let base = DynamicColor(lightHex: "#FFFFFF", darkHex: "#171B1C").dynamic
    public static let elevated = DynamicColor(lightHex: "#FFFFFF", darkHex: "#1E2427").dynamic
    public static let groupedBase = DynamicColor(lightHex: "#F7F8F9", darkHex: "#000000").dynamic
    public static let groupedContent = DynamicColor(lightHex: "#FFFFFF", darkHex: "#171B1C").dynamic
  }
  
  // MARK: - Dim
  
  public enum DimColor {
    public static let thick = DynamicColor(lightHex: "#161D24C2", darkHex: "#000000C2").dynamic
    public static let basic = DynamicColor(lightHex: "#161D280", darkHex: "#00000080").dynamic
    public static let thin = DynamicColor(lightHex: "#161D226", darkHex: "#00000026").dynamic
  }
  
  // MARK: - Pressed
  
  public enum PressedColor {
    public static let light = DynamicColor(lightHex: "#FFFFFF26", darkHex: "#FFFFFF0D").dynamic
    public static let dark = DynamicColor(lightHex: "#28323C0D", darkHex: "FFFFFF0D").dynamic
  }
  
  // MARK: - Border
  
  public enum BorderColor {
    public static let basic1 = DynamicColor(lightHex: "#E9EBEE", darkHex: "#2E363A").dynamic
    public static let basic2 = DynamicColor(lightHex: "#E9EBEE", darkHex: "#00000000").dynamic
  }
  
  // MARK: - Shadow
  
  public enum ShadowColor {
    public static let basic = DynamicColor(lightHex: "#28323C40", darkHex: "#00000000").dynamic
    public static let thin = DynamicColor(lightHex: "#28323C1A", darkHex: "#00000000").dynamic
  }
  
  // MARK: - Text
  
  public enum TextColor {
    public static let primary = DynamicColor(lightHex: "#384553", darkHex: "#F7F8F9").dynamic
    public static let seconday = DynamicColor(lightHex: "#646F7C", darkHex: "#C5C8CE").dynamic
    public static let disabled = DynamicColor(lightHex: "#C5C8CE", darkHex: "#F9A4A0").dynamic
    public static let placeholder = DynamicColor(lightHex: "#C5C8CE", darkHex: "#F9A4A0").dynamic
  }
}
