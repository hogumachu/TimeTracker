import DependencyPlugin
@preconcurrency import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
  name: ModulePaths.UserInterface.DesignSystem.rawValue,
  targets: [
    .implements(
      module: .userInterface(.DesignSystem),
      product: .framework,
      spec: .init(
        sources: .sources,
        resources: .resources(["Resources/**"]),
        dependencies: [
          .SPM.FlexLayout,
          .SPM.PinLayout,
          .SPM.JTAppleCalendar
        ]
      )
    ),
    .demo(
      module: .userInterface(.DesignSystem),
      dependencies: [
        .userInterface(target: .DesignSystem)
      ]
    )
  ]
)
