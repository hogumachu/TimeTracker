import DependencyPlugin
@preconcurrency import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
  name: ModulePaths.Domain.UserService.rawValue,
  targets: [
    .interface(
      module: .domain(.UserService),
      dependencies: [
        .shared(target: .Platform),
      ]
    ),
    .implements(
      module: .domain(.UserService),
      dependencies: [
        .domain(target: .UserService, type: .interface)
      ]
    ),
    .tests(module: .domain(.UserService), dependencies: [
      .domain(target: .UserService)
    ])
  ]
)
