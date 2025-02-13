import DependencyPlugin
@preconcurrency import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
  name: ModulePaths.Shared.Platform.rawValue,
  targets: [
    .implements(
      module: .shared(.Platform),
      product: .framework,
      dependencies: [
        .domain(target: .Entity)
      ]
    ),
    .tests(module: .shared(.Platform), dependencies: [
      .shared(target: .Platform)
    ])
  ]
)
