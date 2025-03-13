import DependencyPlugin
@preconcurrency import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
  name: ModulePaths.Feature.Calendar.rawValue,
  targets: [
    .interface(
      module: .feature(.Calendar),
      dependencies: [
        .feature(target: .FeatureFoundation),
      ]
    ),
    .implementsWithNeedleScript(module: .feature(.Calendar), dependencies: [
      .domain(target: .CalendarService, type: .interface),
      .feature(target: .Calendar, type: .interface),
      .feature(target: .FeatureUIKit),
      .SPM.HorizonCalendar
    ]),
    .testing(module: .feature(.Calendar), dependencies: [
      .feature(target: .Calendar, type: .interface)
    ]),
    .tests(module: .feature(.Calendar), dependencies: [
      .feature(target: .Calendar)
    ]),
    .demo(module: .feature(.Calendar), dependencies: [
      .feature(target: .Calendar)
    ])
  ]
)
