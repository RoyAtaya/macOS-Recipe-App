//
//  RecipeRowView.swift
//  macOS Recipe App
//
//  Created by Roy Ataya


import SwiftUI

extension Bool{
    var toDouble: Double{
        return self ? 1.0 : 0.0
    }
}


struct RecipeRowView: View {
    var recently_used_opacity: Bool
    let recipe: Recipe
    
    var body: some View {
        VStack(alignment:.leading){
            Text(recipe.name)
                .font(.system(size:20, design: .rounded).bold())
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay(checkOverlay, alignment: .trailing)
        .overlay(starOverlay, alignment: .trailing)
    }
    
    private var checkOverlay: some View {
        Image(systemName: "checkmark")
            .font(.title3)
            .symbolVariant(.fill)
            .foregroundColor(.red.opacity(recipe.recentlyMade.toDouble))
            .offset(x: -50)
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
        .buttonStyle(.plain)
    }
    
}

//struct RecipeRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeRowView()
//    }
//}
