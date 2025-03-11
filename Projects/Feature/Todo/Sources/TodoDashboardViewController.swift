//
//  TodoDashboardViewController.swift
//  Todo
//
//  Created by 홍성준 on 3/11/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import DesignSystem
import RIBs
import RxSwift
import UIKit

protocol TodoDashboardPresentableListener: AnyObject {}

final class TodoDashboardViewController:
  BaseViewController,
  TodoDashboardPresentable,
  TodoDashboardViewControllable {
  
  weak var listener: TodoDashboardPresentableListener?
  
}
