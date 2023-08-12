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
    @Environment(\.managedObjectContext) private var moc
    @ObservedObject var recipe: Recipe
    
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
        Button{
            toggleRecentlyMade()
        }label: {
            Image(systemName: "checkmark")
                .font(.title3)
                .symbolVariant(.fill)
                .foregroundColor(recipe.recentlyMade ? .red : .gray.opacity(0.3))
        }
        .buttonStyle(.plain)
        .offset(x: -50)
    }
    
    private var starOverlay: some View {
        Button{
            toggleFavourite()
        } label: {
            Image(systemName: "star")
                .font(.title3)
                .symbolVariant(.fill)
                .foregroundColor(recipe.favourite ? .yellow : .gray.opacity(0.3))
        }
        .buttonStyle(.plain)
    }
    
}

private extension RecipeRowView{
    func toggleFavourite(){
        recipe.favourite.toggle()
        do{
            if moc.hasChanges{
                try moc.save()
            }
        }catch{
            print(error)
        }
    }
    
    func toggleRecentlyMade(){
        recipe.recentlyMade.toggle()
        do{
            if moc.hasChanges{
                try moc.save()
            }
        }catch{
            print(error)
        }
    }
    
}


struct RecipeRowView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRowView(recipe: .preview())
    }
}
