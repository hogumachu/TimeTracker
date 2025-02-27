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
import FeatureUIKit

protocol CalendarPresentableListener: AnyObject {
  var startDate: Date { get }
  var endDate: Date { get }
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
  
  weak var listener: CalendarPresentableListener?
  
  private lazy var contentView = CalendarView().then {
    $0.monthView.register(CalendarDayCell.self)
    $0.delegate = self
    $0.dataSource = self
  }
  private let disposeBag = DisposeBag()
  
  // MARK: - For transition
  
  private weak var selectedView: UIView?
  private lazy var transition = CalendarTransition(from: self)
  
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
  var containingView: UIView? { view }
}

extension CalendarViewController: CalendarViewDelegate {
  func calendarViewDidSelectHeader(_ view: CalendarView) {
    listener?.didSelectHeader()
  }
  
  func calendarViewDidSelectSearch(_ view: CalendarView) {
    listener?.didSelectSearch()
  }
  
  func calendarViewDidSelectNotification(_ view: CalendarView) {
    listener?.didSelectNotification()
  }
  
  func calendar(_ calendar: JTACMonthView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTACDayCell {
    let cell = calendar.dequeueCell(type: CalendarDayCell.self, for: indexPath)
    return cell
  }
  
  func calendar(_ calendar: JTACMonthView, willDisplay cell: JTACDayCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
    listener?.willDisplay(date: date, indexPath: indexPath)
  }
  
  func calendar(_ calendar: JTACMonthView, didSelectDate date: Date, cell: JTACDayCell?, cellState: CellState, indexPath: IndexPath) {
    listener?.didSelect(date: date, indexPath: indexPath)
  }
}

extension CalendarViewController: CalendarViewDataSource {
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
