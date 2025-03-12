//
//  CalendarView.swift
//  Calendar
//
//  Created by 홍성준 on 3/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

import DesignSystem

import FlexLayout
import PinLayout
import Then

final class CalendarView: BaseView {
  
  private let containerView = UIView().with {
    $0.backgroundColor = DesignSystem.BackgroundColor.groupedBase
  }
  private let headerView = CalendarMonthHeaderView()
  private let contentView = CalendarMonthContainerView()
  
  override func setupLayout() {
    addSubview(containerView)
    super.setupLayout()
    
    rootView.flex
      .define {
        $0.addItem(headerView)
          .height(70)
        $0.addItem(contentView)
          .grow(1)
      }
  }
  
  func updateHeader(title: String) {
    headerView.configure(title)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    containerView.pin.all()
    rootView.pin.top(pin.safeArea).horizontally().bottom()
    rootView.flex.layout()
  }
}

final class CalendarMonthContainerView: UIView {
  
  private enum Constants {
    static let cellWidth = UIScreen.main.bounds.width
  }
  
  private var items = (1...3)
    .map { _ in [UIColor.gray, .red, .blue, .orange, .black].randomElement()! }
  
  private let collectionViewFlowLayout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.itemSize = .init(width: Constants.cellWidth, height: UIScreen.main.bounds.height)
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    return layout
  }()
  
  private lazy var collectionView: UICollectionView = {
    let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
    view.isScrollEnabled = true
    view.showsHorizontalScrollIndicator = false
    view.showsVerticalScrollIndicator = true
    view.contentInset = .zero
    view.clipsToBounds = true
    view.register(CalendarMonthCell.self)
    view.isPagingEnabled = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupViews() {
    items.insert(items[items.count - 1], at: 0)
    items.append(items[1])
    
    addSubview(collectionView)
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: topAnchor),
      collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
    ])
    
    collectionView.dataSource = self
    collectionView.delegate = self
  }
  
}

extension CalendarMonthContainerView: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    items.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueCell(type: CalendarMonthCell.self, for: indexPath)
    cell.configure(items[indexPath.row])
    return cell
  }
}

extension CalendarMonthContainerView: UICollectionViewDelegate {
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    let count = items.count
    
    if scrollView.contentOffset.x == 0 {
      scrollView.setContentOffset(
        .init(x: Constants.cellWidth * Double(count - 2), y: scrollView.contentOffset.y),
        animated: false
      )
    }
    
    if scrollView.contentOffset.x == Double(count - 1) * Constants.cellWidth {
      scrollView.setContentOffset(
        .init(x: Constants.cellWidth, y: scrollView.contentOffset.y),
        animated: false
      )
    }
  }
}
