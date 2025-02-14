//
//  CalendarDetailViewController.swift
//  Calendar
//
//  Created by 홍성준 on 2/14/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import UIKit

import RIBs
import RxSwift

import DesignSystem

protocol CalendarDetailPresentableListener: AnyObject {}

final class CalendarDetailViewController:
  BaseViewController,
  CalendarDetailPresentable,
  CalendarDetailViewControllable {
  
  weak var listener: CalendarDetailPresentableListener?
  
}
