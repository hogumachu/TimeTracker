import DependencyPlugin
@preconcurrency import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
  name: ModulePaths.Domain.CalendarService.rawValue,
  targets: [
    .interface(
      module: .domain(.CalendarService),
      dependencies: [
        .shared(target: .Platform),
        .SPM.RxSwift
      ]
    ),
    .implements(module: .domain(.CalendarService), dependencies: [
      .domain(target: .CalendarService, type: .interface)
    ]),
    .tests(module: .domain(.CalendarService), dependencies: [
      .domain(target: .CalendarService)
    ])
  ]
)
