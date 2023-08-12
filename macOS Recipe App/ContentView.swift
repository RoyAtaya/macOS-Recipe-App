//
//  ContentView.swift
//  macOS Recipe App
//
//  Created by Roy Ataya

import SwiftUI

struct ContentView: View {
    @State private var isShowingNewRecipe = false
    @FetchRequest(fetchRequest: Recipe.getAllRecipes()) private var recipes
    var provider = RecipeProvider.shared
    
    @State private var chosen_recipe: String = "----"
    var recently_used_opacity: Bool = true
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer().frame(height: 20)
                Text("Recipe to make: ")
                    .font(.system(size: 20, design: .rounded).bold())
                Spacer().frame(height: 15)
                Text(chosen_recipe)
                    .font(.system(size: 20,  design: .rounded).bold())
                Spacer().frame(height: 30)
            }
            List{
                ForEach(recipes){ recipe in
                    NavigationLink{
                        RecipeDetailView(recipe: recipe)
                    }label: {
                        RecipeRowView(recipe: recipe)
                    }
                    .listRowSeparator(.visible)
                }
            }
        }
        .navigationTitle("Recipe App")
        .toolbar{
            ToolbarItem{
                Button {
                    isShowingNewRecipe.toggle()
                } label: {
                    Text("Add new recipe")
                }
            }
        }
        .sheet(isPresented: $isShowingNewRecipe) {
            CreateRecipeView(viewModel: .init(provider: provider))
        }
        .toolbar{
            ToolbarItem(placement: .primaryAction) {
                Button("Get random recipe"){
                    var selected = recipes.randomElement()
                    var count = 0
                    while(selected?.recentlyMade == true && count < recipes.count){
                        selected = recipes.randomElement()
                        count = count + 1
                    }
                    selected?.recentlyMade = true
                    chosen_recipe = selected?.name ?? "---"
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            let preview = RecipeProvider.shared
            ContentView(provider: preview)
                .environment(\.managedObjectContext, preview.viewContext)
                .onAppear{Recipe.makePreview(count: 10, in: preview.viewContext)}
        }
        .previewDisplayName("Recipe with data")
        NavigationStack{
            let emptyPreview = RecipeProvider.shared
            ContentView(provider: emptyPreview)
                .environment(\.managedObjectContext, emptyPreview.viewContext)
        }
        .previewDisplayName("Recipe with no data")
    }
}
