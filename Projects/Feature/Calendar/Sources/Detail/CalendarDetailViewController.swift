//
//  CalendarDetailViewController.swift
//  Calendar
//
//  Created by 홍성준 on 2/14/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

import RIBs
import RxSwift
import RxCocoa

import DesignSystem
import FeatureUIKit

protocol CalendarDetailPresentableListener: AnyObject {
  var title: Observable<String> { get }
  func backgroundTapped()
}

final class CalendarDetailViewController:
  UIViewController,
  CalendarDetailPresentable,
  CalendarDetailViewControllable {
  
  weak var listener: CalendarDetailPresentableListener?
  
  private let contentView = CalendarDetailView()
  private let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    bind()
    view.addSubview(contentView)
    contentView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      contentView.topAnchor.constraint(equalTo: view.topAnchor),
      contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
  }
  
  private func bind() {
    listener?.title
      .bind(to: contentView.title)
      .disposed(by: disposeBag)
    
    contentView.rx.recongnizedTap
      .asDriver()
      .drive(with: self) { this, _ in
        this.listener?.backgroundTapped()
      }
      .disposed(by: disposeBag)
  }
}

extension CalendarDetailViewController: CalendarTransitionable {
  weak var sharedView: UIView? { contentView.sharedView }
}
