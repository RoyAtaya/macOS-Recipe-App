//
//  Recipe.swift
//  macOS Recipe App
//
//  Created by Roy Ataya on 2023-06-04.
//

import Foundation
import CoreData

final class Recipe: NSManagedObject{
    @NSManaged var ingredients: String
    @NSManaged var name: String
    @NSManaged var steps: String
    @NSManaged var recentlyMade: Bool
    @NSManaged var favourite: Bool
    
    // initalize when a new object is created
    override func awakeFromInsert() {
        super.awakeFromInsert()
        setPrimitiveValue(false, forKey: "favourite")
        setPrimitiveValue(false, forKey: "recentlyMade")
    }
}
