//
//  RecipeDetailView.swift
//  macOS Recipe App
//
//  Created by Roy Ataya

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    var body: some View {
        List{
            Section(header: Text("Ingredients").font(.system(size: 20, design: .rounded).bold())){
                Text(recipe.ingredients)
            }
            Section(header: Text("Steps").font(.system(size: 20, design: .rounded).bold())){
                Text(recipe.steps)
            }
            Section(header: Text("Notes").font(.system(size: 20, design: .rounded).bold())){
                Text(recipe.notes)
            }
        }
        .navigationTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            RecipeDetailView(recipe: .preview())
        }
    }
}
