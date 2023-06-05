//
//  RecipeDetailView.swift
//  macOS Recipe App
//
//  Created by Roy Ataya on 2022-12-31.
//

import SwiftUI

struct RecipeDetailView: View {
    var body: some View {
        List{
            Section(header: Text("Ingredients").font(.system(size: 20, design: .rounded).bold())){
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque pulvinar, augue vel viverra rhoncus, felis risus dapibus mauris, in feugiat elit urna et odio. Integer eros enim, ornare sit amet placerat ac, vulputate sit amet eros. Sed tristique feugiat diam. Phasellus et tortor gravida, iaculis augue sed, elementum diam. In quis diam condimentum est mattis posuere. Proin ut turpis arcu. Donec blandit magna odio, non tincidunt sem volutpat ac. Nunc convallis ante sed bibendum tempor. Fusce viverra orci id enim consequat aliquet.")
            }
            Section(header: Text("Steps").font(.system(size: 20, design: .rounded).bold())){
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque pulvinar, augue vel viverra rhoncus, felis risus dapibus mauris, in feugiat elit urna et odio. Integer eros enim, ornare sit amet placerat ac, vulputate sit amet eros. Sed tristique feugiat diam. Phasellus et tortor gravida, iaculis augue sed, elementum diam. In quis diam condimentum est mattis posuere. Proin ut turpis arcu. Donec blandit magna odio, non tincidunt sem volutpat ac. Nunc convallis ante sed bibendum tempor. Fusce viverra orci id enim consequat aliquet.")
            }
            Section(header: Text("Notes").font(.system(size: 20, design: .rounded).bold())){
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque pulvinar, augue vel viverra rhoncus, felis risus dapibus mauris, in feugiat elit urna et odio. Integer eros enim, ornare sit amet placerat ac, vulputate sit amet eros. Sed tristique feugiat diam. Phasellus et tortor gravida, iaculis augue sed, elementum diam. In quis diam condimentum est mattis posuere. Proin ut turpis arcu. Donec blandit magna odio, non tincidunt sem volutpat ac. Nunc convallis ante sed bibendum tempor. Fusce viverra orci id enim consequat aliquet.")
            }
        }
        .navigationTitle("Name Here")
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            RecipeDetailView()
        }
    }
}
