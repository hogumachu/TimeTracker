@preconcurrency import ProjectDescription

let project = Project(
  name: "TimeTracker",
  targets: [
    .target(
      name: "TimeTracker",
      destinations: .iOS,
      product: .app,
      bundleId: "io.tuist.TimeTracker",
      infoPlist: .extendingDefault(
        with: [
          "UILaunchStoryboardName": "LaunchScreen.storyboard",
          "UIApplicationSceneManifest": [
            "UIApplicationSupportsMultipleScenes": false,
            "UISceneConfigurations": [
              "UIWindowSceneSessionRoleApplication": [
                [
                  "UISceneConfigurationName": "Default Configuration",
                  "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
                ],
              ]
            ]
          ],
        ]
      ),
      sources: ["TimeTracker/Sources/**"],
      resources: ["TimeTracker/Resources/**"],
      dependencies: []
    ),
    .target(
      name: "TimeTrackerTests",
      destinations: .iOS,
      product: .unitTests,
      bundleId: "io.tuist.TimeTrackerTests",
      infoPlist: .default,
      sources: ["TimeTracker/Tests/**"],
      resources: [],
      dependencies: [.target(name: "TimeTracker")]
    ),
  ]
)
