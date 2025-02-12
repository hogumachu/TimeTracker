//
//  UserService.swift
//  UserService
//
//  Created by 홍성준 on 2/13/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import Foundation
import UserServiceInterface

public final class UserService: UserServicable {
  
  private enum Key {
    static let onboardingCompleted = "user.service.onboarding.completed"
  }
  
  private let userDefaults: UserDefaults
  
  public init(userDefaults: UserDefaults = .standard) {
    self.userDefaults = userDefaults
  }
  
  public func onboardingRequired() -> Bool {
    let onboardingCompleted = userDefaults.bool(forKey: Key.onboardingCompleted)
    return !onboardingCompleted
  }
  
  public func onboardingCompleted() {
    userDefaults.setValue(true, forKey: Key.onboardingCompleted)
  }
}
