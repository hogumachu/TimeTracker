//
//  CalendarViewController.swift
//  Calendar
//
//  Created by 홍성준 on 2/13/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import DesignSystem
import RIBs
import RxSwift
import UIKit

protocol CalendarPresentableListener: AnyObject {}

final class CalendarViewController:
  BaseViewController,
  CalendarPresentable,
  CalendarViewControllable {
  
  weak var listener: CalendarPresentableListener?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemPink
  }
}
