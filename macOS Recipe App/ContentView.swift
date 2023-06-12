//
//  ContentView.swift
//  macOS Recipe App
//
//  Created by Roy Ataya

import SwiftUI

struct ContentView: View {
    @State private var isShowingNewContact = false
    @FetchRequest(fetchRequest: Recipe.getAllRecipes()) private var recipes
    var provider = RecipeProvider.shared
    
    var chosen_recipe: String = "Burgers"
    var recently_used_opacity: Bool = true
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer().frame(height: 20)
                Text("Recipe to make: ")
                    .font(.system(size: 20, design: .rounded).bold())
                Spacer().frame(height: 15)
                Text(chosen_recipe)
                    .font(.system(size: 20, design: .rounded).bold())
                Spacer().frame(height: 30)
            }
            List{
                ForEach(recipes){ recipe in
                    NavigationLink{
                        RecipeDetailView()
                    }label: {
                        RecipeRowView(recently_used_opacity: recipe.recentlyMade, recipe: recipe)
                    }
                    .listRowSeparator(.visible)
                }
            }
        }
        .navigationTitle("Recipe App")
        .toolbar{
            ToolbarItem{
                Button {
                    isShowingNewContact.toggle()
                } label: {
                    Text("Add new recipe")
                }
            }
        }
        .sheet(isPresented: $isShowingNewContact) {
            CreateRecipeView(viewModel: .init(provider: provider))
        }
        .toolbar{
            ToolbarItem(placement: .primaryAction) {
                Button("Get random recipe"){
                    // TODO: Add get random recipe logic
                    print("Get random recipe")
                }
            }
        }
    }
}








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ContentView()
        }
    }
}
