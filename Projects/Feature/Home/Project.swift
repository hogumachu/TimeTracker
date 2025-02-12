import DependencyPlugin
@preconcurrency import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
  name: ModulePaths.Feature.Home.rawValue,
  targets: [
    .interface(
      module: .feature(.Home),
      dependencies: [
        .SPM.RIBs
      ]
    ),
    .implements(module: .feature(.Home), dependencies: [
      .feature(target: .Home, type: .interface),
      .feature(target: .FeatureKit)
    ]),
    .testing(module: .feature(.Home), dependencies: [
      .feature(target: .Home, type: .interface)
    ]),
    .tests(module: .feature(.Home), dependencies: [
      .feature(target: .Home)
    ]),
    .demo(module: .feature(.Home), dependencies: [
      .feature(target: .Home)
    ])
  ]
)
