import DependencyPlugin
@preconcurrency import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
  name: ModulePaths.Shared.AppFoundation.rawValue,
  targets: [
    .implements(
      module: .shared(
        .AppFoundation
      ),
      dependencies: [
        .SPM.RIBs
      ]
    )
  ]
)
