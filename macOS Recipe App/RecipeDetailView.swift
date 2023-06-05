//
//  RecipeDetailView.swift
//  macOS Recipe App
//
//  Created by Roy Ataya on 2023-06-04.
//

import SwiftUI

struct RecipeDetailView: View {
    var body: some View {
        List{
            Section("Ingredients"){
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque pulvinar, augue vel viverra rhoncus, felis risus dapibus mauris, in feugiat elit urna et odio. Integer eros enim, ornare sit amet placerat ac, vulputate sit amet eros. Sed tristique feugiat diam. Phasellus et tortor gravida, iaculis augue sed, elementum diam. In quis diam condimentum est mattis posuere. Proin ut turpis arcu. Donec blandit magna odio, non tincidunt sem volutpat ac. Nunc convallis ante sed bibendum tempor. Fusce viverra orci id enim consequat aliquet.")
            }
            Section("Steps"){
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque pulvinar, augue vel viverra rhoncus, felis risus dapibus mauris, in feugiat elit urna et odio. Integer eros enim, ornare sit amet placerat ac, vulputate sit amet eros. Sed tristique feugiat diam. Phasellus et tortor gravida, iaculis augue sed, elementum diam. In quis diam condimentum est mattis posuere. Proin ut turpis arcu. Donec blandit magna odio, non tincidunt sem volutpat ac. Nunc convallis ante sed bibendum tempor. Fusce viverra orci id enim consequat aliquet.")
            }
            Section("Notes"){
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque pulvinar, augue vel viverra rhoncus, felis risus dapibus mauris, in feugiat elit urna et odio. Integer eros enim, ornare sit amet placerat ac, vulputate sit amet eros. Sed tristique feugiat diam. Phasellus et tortor gravida, iaculis augue sed, elementum diam. In quis diam condimentum est mattis posuere. Proin ut turpis arcu. Donec blandit magna odio, non tincidunt sem volutpat ac. Nunc convallis ante sed bibendum tempor. Fusce viverra orci id enim consequat aliquet.")
            }
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView()
    }
}
