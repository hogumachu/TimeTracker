//
//  CalendarViewController.swift
//  Calendar
//
//  Created by 홍성준 on 2/13/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

import JTAppleCalendar
import RIBs
import RxSwift
import RxCocoa
import Then

import DesignSystem
import Entity
import FeatureUIKit

protocol CalendarPresentableListener: AnyObject {
  var startDate: Date { get }
  var endDate: Date { get }
  var monthTitle: Observable<String> { get }
  func model(at indexPath: IndexPath) -> CalendarDayModel?
  func didSelectHeader()
  func didSelectSearch()
  func didSelectNotification()
  func didSelect(date: Date, indexPath: IndexPath)
  func willDisplay(date: Date, indexPath: IndexPath)
}

final class CalendarViewController:
  BaseViewController,
  CalendarPresentable,
  CalendarViewControllable {
  
  weak var listener: CalendarPresentableListener? {
    didSet { bind() }
  }
  
  private lazy var contentView = CalendarMonthView().with {
    $0.delegate = self
    $0.dataSoruce = self
  }
  
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
    contentView.visibleDates { [weak self] segment in
      if let date = segment.monthDates.first?.date {
        self?.listener?.willDisplay(date: date, indexPath: .init(row: 0, section: 0))
      }
    }
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
  
  func dateUpdated() {
    /// reloadData 확인할 것들이 있음
    ///
    /// - 해당 메서드 호출 시 `ConfigurationParameters`를 다시 설정하지 않음
    /// - `ConfigurationParameters`를 다시 설정하기 위해서는 `DataSource`를 다시 설정해야 함
    /// - 시작 날짜와 끝 날짜가 변경되었을 때 업데이트 하는 방식 확인 필요
    contentView.reloadData()
  }
}

extension CalendarViewController: CalendarTransitioning {
  var sharedView: UIView? { selectedView }
  var containingView: UIView? { view }
}

extension CalendarViewController: CalendarMonthViewDelegate {
  
  func calendar(_ calendar: JTACMonthView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTACDayCell {
    let cell = calendar.dequeueCell(type: CalendarDayCell.self, for: indexPath)
    guard let model = listener?.model(at: indexPath) else {
      return cell
    }
    cell.configure(model.cellModel)
    return cell
  }
  
  func calendar(_ calendar: JTACMonthView, willDisplay cell: JTACDayCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
    let cell = calendar.dequeueCell(type: CalendarDayCell.self, for: indexPath)
    guard let model = listener?.model(at: indexPath) else { return }
    cell.configure(model.cellModel)
    listener?.willDisplay(date: date, indexPath: indexPath)
  }
  
  func calendar(_ calendar: JTACMonthView, didSelectDate date: Date, cell: JTACDayCell?, cellState: CellState, indexPath: IndexPath) {
    listener?.didSelect(date: date, indexPath: indexPath)
  }
}

extension CalendarViewController: CalendarMonthViewDataSource {
  func configureCalendar(_ calendar: JTACMonthView) -> ConfigurationParameters {
    guard let startDate = listener?.startDate, let endDate = listener?.endDate else {
      return .empty
    }
    return .init(
      startDate: startDate,
      endDate: endDate,
      numberOfRows: 6,
      generateInDates: .forAllMonths,
      generateOutDates: .tillEndOfGrid,
      firstDayOfWeek: .sunday
    )
  }
}
