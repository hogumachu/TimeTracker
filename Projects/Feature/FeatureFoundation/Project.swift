import DependencyPlugin
@preconcurrency import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
  name: ModulePaths.Feature.FeatureFoundation.rawValue,
  targets: [
    .implements(
      module: .feature(.FeatureFoundation),
//      product: .framework,
      dependencies: [
        .shared(target: .Platform),
      ]
    )
  ]
)
