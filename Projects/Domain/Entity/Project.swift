import DependencyPlugin
@preconcurrency import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
  name: ModulePaths.Domain.Entity.rawValue,
  targets: [
    .implements(module: .domain(.Entity))
  ]
)
