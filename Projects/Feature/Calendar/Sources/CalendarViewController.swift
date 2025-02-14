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
  func detailTapped()
}

final class CalendarViewController:
  BaseViewController,
  CalendarPresentable,
  CalendarViewControllable {
  
  weak var listener: CalendarPresentableListener?
  
  private let contentView = CalendarView()
  private let disposeBag = DisposeBag()
  
  override init() {
    super.init()
    bind()
  }
  
  override func loadView() {
    view = contentView
  }
  
  private func bind() {
    contentView.button.rx.tap
      .bind(with: self) { this, _ in
        this.listener?.detailTapped()
      }
      .disposed(by: disposeBag)
  }
}

// MARK: - CollectionViewDelegate

extension CalendarViewController: UICollectionViewDelegate {
  
}

// MARK: - CollectionViewDataSource

extension CalendarViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    .init()
  }
}
