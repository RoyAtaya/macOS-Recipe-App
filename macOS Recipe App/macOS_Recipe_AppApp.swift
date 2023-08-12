//
//  macOS_Recipe_AppApp.swift
//  macOS Recipe App
//
//  Created by Roy Ataya
//

import SwiftUI

@main
struct macOS_Recipe_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, RecipeProvider.shared.viewContext)
        }
    }
}
