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
      .domain(target: .CalendarService, type: .interface),
      .feature(target: .Calendar, type: .interface),
      .feature(target: .FeatureKit),
      .feature(target: .Home, type: .interface),
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
