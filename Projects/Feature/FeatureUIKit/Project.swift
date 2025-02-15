import DependencyPlugin
@preconcurrency import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
  name: ModulePaths.Feature.FeatureUIKit.rawValue,
  targets: [
    .implements(
      module: .feature(.FeatureUIKit),
//      product: .framework,
      dependencies: [
        .feature(target: .FeatureFoundation),
        .userInterface(target: .DesignSystem),
        .SPM.Needle,
        .SPM.RxCocoa
      ]
    )
  ]
)
