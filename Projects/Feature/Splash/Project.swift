import DependencyPlugin
@preconcurrency import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
  name: ModulePaths.Feature.Splash.rawValue,
  targets: [
    .interface(
      module: .feature(.Splash),
      dependencies: [
        .SPM.RIBs
      ]
    ),
    .implements(module: .feature(.Splash), dependencies: [
      .feature(target: .Splash, type: .interface),
      .feature(target: .FeatureKit)
    ]),
    .testing(module: .feature(.Splash), dependencies: [
      .feature(target: .Splash, type: .interface)
    ]),
    .tests(module: .feature(.Splash), dependencies: [
      .feature(target: .Splash)
    ]),
    .demo(module: .feature(.Splash), dependencies: [
      .feature(target: .Splash)
    ])
  ]
)
