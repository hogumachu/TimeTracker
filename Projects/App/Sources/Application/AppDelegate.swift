import UIKit

import SwiftDate

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
  ) -> Bool {
    registerProviderFactories()
    setupSwiftDate()
    return true
  }
  
  private func setupSwiftDate() {
    let korean = Region(
      calendar: Calendars.gregorian,
      zone: Zones.asiaSeoul,
      locale: Locales.korean
    )
    SwiftDate.defaultRegion = korean
  }
}
