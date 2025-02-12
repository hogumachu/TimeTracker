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
  HomeDashboardPresentable,
  HomeDashboardViewControllable {
  
  weak var listener: HomeDashboardPresentableListener?
}
