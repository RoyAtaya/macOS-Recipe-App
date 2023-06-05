//
//  macOS_Recipe_AppApp.swift
//  macOS Recipe App
//
//  Created by Roy Ataya on 2022-12-31.
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
