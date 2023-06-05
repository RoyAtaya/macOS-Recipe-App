//
//  ContentView.swift
//  macOS Recipe App
//
//  Created by Roy Ataya on 2022-12-31.
//

import SwiftUI

struct ContentView: View {
    var chosen_recipe: String = "Burgers"
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
                    VStack(alignment:.leading){
                        Text("Name")
                            .font(.system(size:20, design: .rounded).bold())
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .overlay(checkOverlay, alignment: .topTrailing)
                    .overlay(starOverlay, alignment: .topTrailing)
                }
            }
        }.navigationTitle("Recipe App")
            .toolbar{
                Button("Add new recipe"){
                    // TODO: Add new recipe logic
                    print("Add new recipe")
                }
                
                Button("Get random recipe"){
                    // TODO: Add get random recipe logic
                    print("Get random recipe")
                }
            }
    }
    
    private var checkOverlay: some View {
        Image(systemName: "checkmark")
            .font(.title3)
            .symbolVariant(.fill)
            .foregroundColor(.gray.opacity(0.3))
            .offset(x: -100)
    }
    
    private var starOverlay: some View {
        Button{
            // TODO: handle favourite logic
        } label: {
            Image(systemName: "star")
                .font(.title3)
                .symbolVariant(.fill)
                .foregroundColor(.gray.opacity(0.3))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
