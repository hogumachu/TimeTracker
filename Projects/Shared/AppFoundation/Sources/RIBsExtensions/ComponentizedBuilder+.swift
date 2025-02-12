//
//  ComponentizedBuilder+.swift
//  AppFoundation
//
//  Created by 홍성준 on 2/12/25.
//  Copyright © 2025 com.hogumachu. All rights reserved.
//

import RIBs
import UIKit

extension ComponentizedBuilder where DynamicComponentDependency == Void, DynamicBuildDependency == Void {
  public final func build() -> Router {
    return build(
      withDynamicBuildDependency: Void(),
      dynamicComponentDependency: Void()
    )
  }
}

extension ComponentizedBuilder where DynamicComponentDependency == Void {
  public final func build(
    with dynamicBuildDependency: DynamicBuildDependency
  ) -> Router {
    return build(
      withDynamicBuildDependency: dynamicBuildDependency,
      dynamicComponentDependency: Void()
    )
  }
}

extension ComponentizedBuilder where DynamicBuildDependency == Void {
  public final func build(
    with dynamicComponentDependency: DynamicComponentDependency
  ) -> Router {
    return build(
      withDynamicBuildDependency: Void(),
      dynamicComponentDependency: dynamicComponentDependency
    )
  }
}
