

import AppFoundation
import Calendar
import CalendarInterface
import CalendarService
import CalendarServiceInterface
import Foundation
import Home
import HomeInterface
import NeedleFoundation
import RIBs
import Splash
import SplashInterface
import UserService
import UserServiceInterface

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class RootDependency3944cc797a4a88956fb5Provider: RootDependency {
    var userService: UserServicable {
        return appComponent.userService
    }
    var homeDashboardBuilder: HomeDashboardBuildable {
        return appComponent.homeDashboardBuilder
    }
    var splashBuilder: SplashBuildable {
        return appComponent.splashBuilder
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->RootComponent
private func factory264bfc4d4cb6b0629b40f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return RootDependency3944cc797a4a88956fb5Provider(appComponent: parent1(component) as! AppComponent)
}
private class HomeDashboardDependency6ab1c331b788a03d35b0Provider: HomeDashboardDependency {
    var calendarBuilder: CalendarBuildable {
        return appComponent.calendarBuilder
    }
    var calendarService: CalendarServicable {
        return appComponent.calendarService
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->HomeDashboardComponent
private func factory1b289746fa6e3ba53918f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return HomeDashboardDependency6ab1c331b788a03d35b0Provider(appComponent: parent1(component) as! AppComponent)
}
private class SplashDependencye0cb7136f2ec3edfd60aProvider: SplashDependency {


    init() {

    }
}
/// ^->AppComponent->SplashComponent
private func factoryace9f05f51d68f4c0677e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SplashDependencye0cb7136f2ec3edfd60aProvider()
}
private class CalendarDetailDependencya192756e4ba46bd2f60bProvider: CalendarDetailDependency {


    init() {

    }
}
/// ^->AppComponent->CalendarComponent->CalendarDetailComponent
private func factory3694fcdcaa4d61b47357e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return CalendarDetailDependencya192756e4ba46bd2f60bProvider()
}
private class CalendarDependency413e3f1dda33aa6ff6aeProvider: CalendarDependency {
    var calendarService: CalendarServicable {
        return appComponent.calendarService
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->CalendarComponent
private func factorye6390b2af02fceff6db0f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return CalendarDependency413e3f1dda33aa6ff6aeProvider(appComponent: parent1(component) as! AppComponent)
}

#else
extension AppComponent: NeedleFoundation.Registration {
    public func registerItems() {


    }
}
extension RootComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\RootDependency.userService] = "userService-UserServicable"
        keyPathToName[\RootDependency.homeDashboardBuilder] = "homeDashboardBuilder-HomeDashboardBuildable"
        keyPathToName[\RootDependency.splashBuilder] = "splashBuilder-SplashBuildable"
    }
}
extension HomeDashboardComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\HomeDashboardDependency.calendarBuilder] = "calendarBuilder-CalendarBuildable"
        keyPathToName[\HomeDashboardDependency.calendarService] = "calendarService-CalendarServicable"
    }
}
extension SplashComponent: NeedleFoundation.Registration {
    public func registerItems() {

    }
}
extension CalendarDetailComponent: NeedleFoundation.Registration {
    public func registerItems() {

    }
}
extension CalendarComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\CalendarDependency.calendarService] = "calendarService-CalendarServicable"

    }
}


#endif

private func factoryEmptyDependencyProvider(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmptyDependencyProvider(component: component)
}

// MARK: - Registration
private func registerProviderFactory(_ componentPath: String, _ factory: @escaping (NeedleFoundation.Scope) -> AnyObject) {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: componentPath, factory)
}

#if !NEEDLE_DYNAMIC

@inline(never) private func register1() {
    registerProviderFactory("^->AppComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->AppComponent->RootComponent", factory264bfc4d4cb6b0629b40f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->HomeDashboardComponent", factory1b289746fa6e3ba53918f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SplashComponent", factoryace9f05f51d68f4c0677e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->CalendarComponent->CalendarDetailComponent", factory3694fcdcaa4d61b47357e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->CalendarComponent", factorye6390b2af02fceff6db0f47b58f8f304c97af4d5)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
