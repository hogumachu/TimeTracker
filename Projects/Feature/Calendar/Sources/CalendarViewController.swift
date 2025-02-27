//
//  CalendarViewController.swift
//  Calendar
//
//  Created by 홍성준 on 2/13/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

import RIBs
import RxSwift
import RxCocoa

import DesignSystem

protocol CalendarPresentableListener: AnyObject {
  func didSelected(at indexPath: IndexPath)
}

final class CalendarViewController:
  BaseViewController,
  CalendarPresentable,
  CalendarViewControllable {
  
  weak var listener: CalendarPresentableListener?
  
  private lazy var transition = CalendarTransition(from: self)
  private let contentView = UIView()
  private var selectedView: UIView?
  private let disposeBag = DisposeBag()
  
  override init() {
    super.init()
    setupViews()
    bind()
  }
  
  override func loadView() {
    view = contentView
  }
  
  private func setupViews() {}
  
  private func bind() {}
  
  func presentWithCustomTransition(_ viewControllable: ViewControllable) {
    let viewController = viewControllable.uiviewController
    viewController.transitioningDelegate = transition
    viewController.modalPresentationStyle = .overFullScreen
    present(viewController, animated: true)
  }
}

extension CalendarViewController: CalendarTransitioning {
  var sharedView: UIView? { selectedView }
  var containingView: UIView? { contentView }
}
