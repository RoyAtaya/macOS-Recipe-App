//
//  RecipeProvider.swift
//  macOS Recipe App
//
//  Created by Roy Ataya on
//

import Foundation
import CoreData
import SwiftUI

final class RecipeProvider{
    static let shared = RecipeProvider()
    
    private let persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext{
        persistentContainer.viewContext
    }
    
    var newContext: NSManagedObjectContext{
        persistentContainer.newBackgroundContext()
    }
    
    
    private init(){
        persistentContainer = NSPersistentContainer(name: "RecipesDataModel")
        if EnvironmentValues.isPreview{
            persistentContainer.persistentStoreDescriptions.first?.url = .init(filePath: "/dev/null")
        }
        persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
        persistentContainer.loadPersistentStores{_, error in
            if let error{
                fatalError("Unable to load store with error:\(error)")
            }
        }
    }
}

extension EnvironmentValues{
    static var isPreview: Bool{
        return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
}
