//
//  AppComponent.swift
//  TimeTracker
//
//  Created by 홍성준 on 2/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import Foundation
import NeedleFoundation

final class AppComponent: BootstrapComponent {
  var rootBuilder: RootBuildable {
    RootBuilder {
      RootComponent(parent: self)
    }
  }
}
