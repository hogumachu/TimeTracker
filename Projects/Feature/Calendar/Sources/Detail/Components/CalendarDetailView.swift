//
//  CalendarDetailView.swift
//  CalendarInterface
//
//  Created by 홍성준 on 2/14/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa
import Then

import DesignSystem

final class CalendarDetailView: UIView {
  
  var title: Binder<String> {
    return Binder(self) { this, title in
      this.updateTitle(title)
    }
  }
  
  private let titleLabel = UILabel().with {
    $0.font = DesignSystem.Typography.subtitle1
    $0.textColor = DesignSystem.TextColor.primary
    $0.translatesAutoresizingMaskIntoConstraints = false
  }
  
  private let contentView = CalendarDetailContentView().with {
    $0.backgroundColor = DesignSystem.BackgroundColor.base
    $0.clipsToBounds = true
    $0.layer.cornerRadius = 16
    $0.layer.cornerCurve = .continuous
    $0.translatesAutoresizingMaskIntoConstraints = false
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func updateTitle(_ title: String) {
    titleLabel.text = title
  }
  
  private func setupViews() {
    backgroundColor = DesignSystem.BackgroundColor.groupedBase
    addSubview(titleLabel)
    addSubview(contentView)
    
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
      
      contentView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
      contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
      contentView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
    ])
  }
}

extension CalendarDetailView: CalendarTransitionable {
  weak var sharedView: UIView? { contentView }
}
