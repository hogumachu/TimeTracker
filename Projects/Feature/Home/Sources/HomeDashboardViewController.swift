//
//  HomeDashboardViewController.swift
//  Home
//
//  Created by 홍성준 on 2/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import DesignSystem
import RIBs
import RxSwift
import UIKit

protocol HomeDashboardPresentableListener: AnyObject {}

final class HomeDashboardViewController:
  BaseViewController,
  HomeDashboardViewControllable {
  
  weak var listener: HomeDashboardPresentableListener?
  
}

extension HomeDashboardViewController: HomeDashboardPresentable {
  
  func focus(on date: Date) {
    // TODO: - Date에 초점 이동
  }
}
