import DependencyPlugin
@preconcurrency import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
  name: ModulePaths.UserInterface.DesignSystem.rawValue,
  targets: [
    .implements(
      module: .userInterface(.DesignSystem),
      dependencies: [
        .SPM.FlexLayout,
        .SPM.PinLayout
      ]
    ),
    .demo(
      module: .userInterface(.DesignSystem),
      dependencies: [
        .userInterface(target: .DesignSystem)
      ]
    )
  ]
)
