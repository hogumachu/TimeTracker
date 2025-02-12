

import AppFoundation
import Foundation
import NeedleFoundation
import RIBs

// swiftlint:disable unused_declaration
private let needleDependenciesHash: String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

    private class RootDependency3944cc797a4a88956fb5Provider: RootDependency {
        init() {}
    }

    /// ^->AppComponent->RootComponent
    private func factory264bfc4d4cb6b0629b40e3b0c44298fc1c149afb(_: NeedleFoundation.Scope) -> AnyObject {
        return RootDependency3944cc797a4a88956fb5Provider()
    }

#else
    extension AppComponent: NeedleFoundation.Registration {
        public func registerItems() {}
    }

    extension RootComponent: NeedleFoundation.Registration {
        public func registerItems() {}
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
        registerProviderFactory("^->AppComponent->RootComponent", factory264bfc4d4cb6b0629b40e3b0c44298fc1c149afb)
    }
#endif

public func registerProviderFactories() {
    #if !NEEDLE_DYNAMIC
        register1()
    #endif
}
