//
//  DesignSystem+Typography.swift
//  DesignSystem
//
//  Created by sungjun.hong on 2/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

extension DesignSystem {
  
  public enum Typography {
    public static let header1 = DesignSystemFontFamily.Pretendard.semiBold.font(size: 28)
    public static let header2 = DesignSystemFontFamily.Pretendard.semiBold.font(size: 24)
    public static let subtitle1 = DesignSystemFontFamily.Pretendard.semiBold.font(size: 18)
    public static let subtitle2 = DesignSystemFontFamily.Pretendard.semiBold.font(size: 16)
    public static let subtitle3 = DesignSystemFontFamily.Pretendard.semiBold.font(size: 14)
    public static let subtitle4 = DesignSystemFontFamily.Pretendard.semiBold.font(size: 12)
    public static let body1 = DesignSystemFontFamily.Pretendard.regular.font(size: 16)
    public static let body2 = DesignSystemFontFamily.Pretendard.regular.font(size: 14)
    public static let caption1 = DesignSystemFontFamily.Pretendard.regular.font(size: 12)
    public static let caption2 = DesignSystemFontFamily.Pretendard.semiBold.font(size: 10)
  }
}
