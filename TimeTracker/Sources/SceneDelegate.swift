//
//  SceneDelegate.swift
//  TimeTracker
//
//  Created by 홍성준 on 2/10/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let scene = scene as? UIWindowScene else { return }
    let window = UIWindow(windowScene: scene)
    // TODO: - Set View Controller
    let viewController = UIViewController()
    viewController.view.backgroundColor = .systemPink
    window.rootViewController = viewController
    window.makeKeyAndVisible()
    self.window = window
  }
}
