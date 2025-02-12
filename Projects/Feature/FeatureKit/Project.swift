import DependencyPlugin
@preconcurrency import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
  name: ModulePaths.Feature.FeatureKit.rawValue,
  targets: [
    .implements(
      module: .feature(.FeatureKit),
      dependencies: [
        .shared(target: .AppFoundation),
        .shared(target: .Platform),
        .userInterface(target: .DesignSystem),
        .SPM.Needle
      ]
    )
  ]
)
