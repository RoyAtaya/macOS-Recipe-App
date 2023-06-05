//
//  RecipeProvider.swift
//  macOS Recipe App
//
//  Created by Roy Ataya on 2023-06-04.
//

import Foundation
import CoreData

final class RecipeProvider{
    static let shared = RecipeProvider()
    
    private let persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext{
        persistentContainer.viewContext
    }
    
    private init(){
        persistentContainer = NSPersistentContainer(name: "RecipesDataModel")
        persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
        persistentContainer.loadPersistentStores{_, error in
            if let error{
                fatalError("Unable to load store with error:\(error)")
            }
        }
    }
}
