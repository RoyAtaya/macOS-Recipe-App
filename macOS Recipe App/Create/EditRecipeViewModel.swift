//
//  EditRecipeViewModel.swift
//  macOS Recipe App
//
//  Created by Roy Ataya

import Foundation
import CoreData

final class EditRecipeViewModel: ObservableObject{
    @Published var recipe: Recipe
    let isNew: Bool
    private let context: NSManagedObjectContext
    
    init(provider: RecipeProvider, recipe:Recipe? = nil){
        self.context = provider.newContext
        if let recipe, let existingRecipeCopy = try? context.existingObject(with: recipe.objectID) as? Recipe{
            self.recipe = existingRecipeCopy
            self.isNew = false
        }else{
            self.recipe = Recipe(context: self.context)  // pass in self.context because we don't want to create a brand new context every single time, we just want to use the new context we just created.
            self.isNew = true
        }
    }
    
    func save() throws{
        if context.hasChanges{
            try context.save()
        }
    }
}
