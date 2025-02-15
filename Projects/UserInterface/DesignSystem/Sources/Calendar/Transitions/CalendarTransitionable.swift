//
//  CalendarTransitionable.swift
//  DesignSystem
//
//  Created by 홍성준 on 2/14/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

public protocol CalendarTransitionable {
  var sharedView: UIView? { get }
  func animateAlongPresentation(animator: UIViewPropertyAnimator, origin: CGRect, destination: CGRect)
  func animateAlongDismissal(animator: UIViewPropertyAnimator, destination: CGRect)
}

extension CalendarTransitionable {
  public func animateAlongPresentation(animator: UIViewPropertyAnimator, origin: CGRect, destination: CGRect) {}
  public func animateAlongDismissal(animator: UIViewPropertyAnimator, destination: CGRect) {}
}
