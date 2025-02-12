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
    public static let header1 = UIFont(data: DesignSystemAsset.pretendardSemiBold, size: 28)
    public static let header2 = UIFont(data: DesignSystemAsset.pretendardSemiBold, size: 24)
    public static let subtitle1 = UIFont(data: DesignSystemAsset.pretendardSemiBold, size: 18)
    public static let subtitle2 = UIFont(data: DesignSystemAsset.pretendardSemiBold, size: 16)
    public static let subtitle3 = UIFont(data: DesignSystemAsset.pretendardSemiBold, size: 14)
    public static let subtitle4 = UIFont(data: DesignSystemAsset.pretendardSemiBold, size: 12)
    public static let body1 = UIFont(data: DesignSystemAsset.pretendardRegular, size: 16)
    public static let body2 = UIFont(data: DesignSystemAsset.pretendardRegular, size: 14)
    public static let caption1 = UIFont(data: DesignSystemAsset.pretendardRegular, size: 12)
    public static let caption2 = UIFont(data: DesignSystemAsset.pretendardSemiBold, size: 10)
  }
}

// MARK: - Internal

private extension UIFont {
  convenience init?(data: DesignSystemData, size: CGFloat) {
    self.init(name: data.name, size: size)
  }
}
