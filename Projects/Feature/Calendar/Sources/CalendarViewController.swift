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
import Then

import DesignSystem
import Entity
import FeatureUIKit

protocol CalendarPresentableListener: AnyObject {
  var monthTitle: Observable<String> { get }
  func didSelectHeader()
  func didSelectSearch()
  func didSelectNotification()
}

final class CalendarViewController:
  BaseViewController,
  CalendarPresentable,
  CalendarViewControllable {
  
  weak var listener: CalendarPresentableListener? {
    didSet { bind() }
  }
  
  private lazy var contentView = CalendarContentView()
  
  private let disposeBag = DisposeBag()
  
  // MARK: - For transition
  
  private weak var selectedView: UIView?
  private lazy var transition = CalendarTransition(from: self)
  
  override init() {
    super.init()
    setupViews()
  }
  
  override func loadView() {
    view = contentView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    bind()
  }
  
  private func setupViews() {}
  
  private func bind() {
    listener?.monthTitle
      .subscribe(with: self) { this, title in
        this.contentView.updateHeader(title: title)
      }
      .disposed(by: disposeBag)
  }
  
  func presentWithCustomTransition(_ viewControllable: ViewControllable) {
    let viewController = viewControllable.uiviewController
    viewController.transitioningDelegate = transition
    viewController.modalPresentationStyle = .overFullScreen
    present(viewController, animated: true)
  }
}

extension CalendarViewController: CalendarTransitioning {
  weak var sharedView: UIView? { selectedView }
  weak var containingView: UIView? { view }
}
