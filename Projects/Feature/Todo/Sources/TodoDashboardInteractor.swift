//
//  TodoDashboardInteractor.swift
//  Todo
//
//  Created by 홍성준 on 3/11/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import Foundation
import RIBs
import RxSwift
import TodoInterface

// MARK: - TodoDashboardPresentable

protocol TodoDashboardPresentable: Presentable {
  var listener: TodoDashboardPresentableListener? { get set }
}

// MARK: - TodoDashboardInteractor

final class TodoDashboardInteractor:
  PresentableInteractor<TodoDashboardPresentable>,
  TodoDashboardInteractable,
  TodoDashboardPresentableListener {
  
  weak var router: TodoDashboardRouting?
  weak var listener: TodoDashboardListener?
  
  override init(presenter: TodoDashboardPresentable) {
    super.init(presenter: presenter)
    presenter.listener = self
  }
  
  override func didBecomeActive() {
    super.didBecomeActive()
  }
  
  override func willResignActive() {
    super.willResignActive()
  }
}
