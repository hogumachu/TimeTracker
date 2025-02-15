//
//  CalendarTransitioning.swift
//  DesignSystem
//
//  Created by 홍성준 on 2/14/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

public protocol CalendarTransitioning: UIViewController {
  var sharedView: UIView? { get }
  var containingView: UIView? { get }
}
