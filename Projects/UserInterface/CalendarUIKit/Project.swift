import DependencyPlugin
@preconcurrency import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
  name: ModulePaths.UserInterface.CalendarUIKit.rawValue,
  targets: [
    .implements(
      module: .userInterface(.CalendarUIKit),
      product: .framework,
      dependencies: [
        .userInterface(target: .DesignSystem)
      ]
    ),
    .demo(module: .userInterface(.CalendarUIKit), dependencies: [
      .userInterface(target: .CalendarUIKit)
    ])
  ]
)
