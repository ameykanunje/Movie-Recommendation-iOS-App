//
//  Flick_ReflectorApp.swift
//  Flick Reflector
//
//  Created by csuftitan on 4/13/24.
//

import SwiftUI

@main
struct Flick_ReflectorApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
