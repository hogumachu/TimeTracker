import RIBs
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?
  var router: LaunchRouting?
  
  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    guard let scene = (scene as? UIWindowScene) else { return }
    let window = UIWindow(windowScene: scene)
    self.window = window
    let router = makeLaunchRouting()
    self.router = router
    router.launch(from: window)
  }
}

extension SceneDelegate {
  private func makeLaunchRouting() -> LaunchRouting {
    let component = AppComponent()
    let builder = component.rootBuilder
    let router = builder.build()
    return router
  }
}
