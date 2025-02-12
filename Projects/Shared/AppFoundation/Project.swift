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
      product: .framework,
      dependencies: [
        .SPM.RIBs,
        .SPM.Then
      ]
    )
  ]
)
