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


extension Recipe{
    @discardableResult
    static func makePreview(count: Int, in context: NSManagedObjectContext) -> [Recipe]{
        var recipes = [Recipe]()
        
        for i in 0..<count{
            let recipe = Recipe(context: context)
            recipe.name = "item \(i)"
            recipe.ingredients = "Ingredient 1\nIngredient 2\nIngredient 3\nIngredient 4"
            recipe.steps = "Step 1\nStep 2\nStep 3\nStep 4"
            recipe.notes = "New Note for item\(i)"
            recipe.favourite = Bool.random()
            recipe.recentlyMade = Bool.random()
            recipes.append(recipe)
        }
        
        return recipes
    }
    
    static func preview(context: NSManagedObjectContext = RecipeProvider.shared.viewContext) -> Recipe{
        return makePreview(count: 1, in: context)[0]
    }
    static func empty(context: NSManagedObjectContext = RecipeProvider.shared.viewContext) -> Recipe{
        return Recipe(context: context)
    }
}
