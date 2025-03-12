//
//  CalendarTransition.swift
//  DesignSystem
//
//  Created by 홍성준 on 2/14/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

import Then

open class CalendarTransition: NSObject {
  
  private enum State {
    case present
    case dismiss
  }
  
  private enum Constants {
    static let duration: TimeInterval = 0.35
    static let dampingRatio: CGFloat = 0.8
  }
  
  private var state: State = .present
  private let presenter: CalendarTransitioning
  
  // MARK: Initialization
  
  public init(from presenter: CalendarTransitioning) {
    self.presenter = presenter
  }
  
  // MARK: - Transition
  
  private func present(with context: UIViewControllerContextTransitioning) {
    guard let fromContainingView = presenter.containingView,
          let fromSharedView = presenter.sharedView,
          let toViewController = context.viewController(forKey: .to) as? CalendarTransitionable,
          let toSharedView = toViewController.sharedView,
          let toView = context.view(forKey: .to)
    else { return }
    
    toView.layoutIfNeeded()
    context.containerView.addSubview(toView)
    
    let toOrigin = context.containerView.convert(
      toSharedView.frame.origin,
      to: context.containerView
    )
    
    let originFrame = CGRect(
      origin: fromContainingView.convert(fromSharedView.frame.origin, to: context.containerView),
      size: fromSharedView.frame.size
    )
    
    let destinationFrame = toView.frame
    
    toView.clipsToBounds = false
    toView.frame = originFrame
    toView.frame.origin.y -= toOrigin.y
    toView.layoutIfNeeded()
    
    fromSharedView.alpha = 0
    
    let translation = CGPoint(
      x: destinationFrame.origin.x - originFrame.origin.x,
      y: destinationFrame.origin.y - originFrame.origin.y
    )
    
    let animator = UIViewPropertyAnimator(
      duration: transitionDuration(using: context),
      dampingRatio: Constants.dampingRatio
    ).with {
      $0.addAnimations {
        toView.do {
          $0.transform = CGAffineTransform(translationX: translation.x, y: translation.y + toOrigin.y)
          $0.frame.size = destinationFrame.size
          $0.layoutIfNeeded()
        }
      }
      
      $0.addCompletion { _ in
        toView.do {
          $0.transform = .identity
          $0.frame = destinationFrame
        }
        
        context.completeTransition(!context.transitionWasCancelled)
      }
    }
    
    toViewController.animateAlongPresentation(animator: animator, origin: originFrame, destination: destinationFrame)
    animator.startAnimation()
  }
  
  private func dismiss(with context: UIViewControllerContextTransitioning) {
    guard let fromViewController = context.viewController(forKey: .from) as? CalendarTransitionable,
          let fromView = context.view(forKey: .from),
          let toContainingView = presenter.containingView,
          let toSharedView = presenter.sharedView
    else { return }
    
    context.containerView.addSubview(fromView)
    
    let destinationFrame = CGRect(
      origin: toContainingView.convert(toSharedView.frame.origin, to: context.containerView),
      size: toSharedView.frame.size
    )
    
    let translation = CGPoint(
      x: destinationFrame.origin.x - fromView.frame.origin.x,
      y: destinationFrame.origin.y + fromView.frame.origin.y + destinationFrame.height
    )
    
    toSharedView.alpha = 0
    
    let originalTransform = toSharedView.transform
    toSharedView.transform = toSharedView.transform.translatedBy(x: (translation.x / 3) * -1, y: (translation.y / 2) * -1)
    
    let animator = UIViewPropertyAnimator(
      duration: transitionDuration(using: context),
      dampingRatio: Constants.dampingRatio
    ).with {
      $0.addAnimations {
        toSharedView.transform = originalTransform
        toSharedView.alpha = 1
        
        fromView.transform = CGAffineTransform(translationX: translation.x, y: translation.y)
        fromView.frame.size = .zero
        fromView.alpha = 0
        fromView.layoutIfNeeded()
      }
      
      $0.addCompletion { _ in
        fromView.removeFromSuperview()
        context.completeTransition(!context.transitionWasCancelled)
      }
    }
    
    fromViewController.animateAlongDismissal(animator: animator, destination: destinationFrame)
    animator.startAnimation()
  }
}

// MARK: - UIViewControllerTransitioningDelegate

extension CalendarTransition: UIViewControllerTransitioningDelegate {
  
  public func animationController(
    forPresented presented: UIViewController,
    presenting: UIViewController,
    source: UIViewController
  ) -> UIViewControllerAnimatedTransitioning? {
    state = .present
    return self
  }
  
  public func animationController(
    forDismissed dismissed: UIViewController
  ) -> UIViewControllerAnimatedTransitioning? {
    state = .dismiss
    return self
  }
}

// MARK: - UIViewControllerAnimatedTransitioning

extension CalendarTransition: UIViewControllerAnimatedTransitioning {
  
  public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return Constants.duration
  }
  
  public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    switch state {
    case .present: present(with: transitionContext)
    case .dismiss: dismiss(with: transitionContext)
    }
  }
}
