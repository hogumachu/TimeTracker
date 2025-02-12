//
//  UserServiceInterface.swift
//  UserServiceInterface
//
//  Created by 홍성준 on 2/13/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import Foundation

public protocol UserServicable: AnyObject {
  func onboardingRequired() -> Bool
  func onboardingCompleted()
}
