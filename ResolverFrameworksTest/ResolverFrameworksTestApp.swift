//
//  ResolverFrameworksTestApp.swift
//  ResolverFrameworksTest
//
//  Created by Michael Long on 6/19/21.
//

import SwiftUI
import ResolverFramework
import PresentationFramework

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerPresentationServices()
    }
}

@main
struct ResolverFrameworksTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
