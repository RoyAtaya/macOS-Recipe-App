//
//  ContentView.swift
//  macOS Recipe App
//
//  Created by Roy Ataya on 2022-12-31.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingNewContact = false
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
                ForEach((0...10), id:\.self){ item in
                    NavigationLink{
                        RecipeDetailView()
                    }label: {
                        RecipeRowView(recently_used_opacity)
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
            CreateRecipeView()
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
