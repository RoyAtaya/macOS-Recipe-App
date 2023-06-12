//
//  Recipe.swift
//  macOS Recipe App
//
//  Created by Roy Ataya on 2023-06-04.
//

import Foundation
import CoreData

final class Recipe: NSManagedObject, Identifiable{
    @NSManaged var ingredients: String
    @NSManaged var name: String
    @NSManaged var steps: String
    @NSManaged var recentlyMade: Bool
    @NSManaged var favourite: Bool
    @NSManaged var notes: String
    
    // initalize when a new object is created
    override func awakeFromInsert() {
        super.awakeFromInsert()
        setPrimitiveValue(false, forKey: "favourite")
        setPrimitiveValue(false, forKey: "recentlyMade")
    }
}


extension Recipe{
    private static var recipesFetchRequest: NSFetchRequest<Recipe>{
        NSFetchRequest(entityName: "Recipe")
    }
    
    static func getAllRecipes() -> NSFetchRequest<Recipe>{
        let request: NSFetchRequest<Recipe> = recipesFetchRequest
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Recipe.name, ascending: true)]
        return request
    }
    
}
