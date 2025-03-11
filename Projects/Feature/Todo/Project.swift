import DependencyPlugin
@preconcurrency import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
  name: ModulePaths.Feature.Todo.rawValue,
  targets: [
    .interface(
      module: .feature(.Todo),
      dependencies: [
        .feature(target: .FeatureFoundation),
      ]
    ),
    .implementsWithNeedleScript(module: .feature(.Todo), dependencies: [
      .feature(target: .FeatureUIKit),
      .feature(target: .Todo, type: .interface),
    ]),
    .testing(module: .feature(.Todo), dependencies: [
      .feature(target: .Todo, type: .interface)
    ]),
    .tests(module: .feature(.Todo), dependencies: [
      .feature(target: .Todo)
    ]),
    .demo(module: .feature(.Todo), dependencies: [
      .feature(target: .Todo)
    ])
  ]
)
