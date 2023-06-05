//
//  CreateRecipeView.swift
//  macOS Recipe App
//
//  Created by Roy Ataya on 2022-12-31.
//

import SwiftUI

struct CreateRecipeView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var name: String = ""
    
    var body: some View {
        List{
            Section(header: Text("General").font(.system(size: 20, design: .rounded).bold())){
                Form {
                    TextField(text: $name, prompt: Text("recipe name")) {
                        Text("Recipe Name:")
                    }
                    Toggle("Favourite", isOn: .constant(true))
                    .toggleStyle(.switch)
                }.font(.system(size: 15, design: .rounded))
            }
            Section(header: Text("Ingredients").font(.system(size: 20, design: .rounded).bold())){
                TextEditor(text: .constant("Ingredients")).foregroundColor(Color.gray).font(.system(size: 15, design: .rounded))
            }
            Section(header: Text("Steps").font(.system(size: 20, design: .rounded).bold())){
                TextEditor(text: .constant("Steps")).foregroundColor(Color.gray).font(.system(size: 15, design: .rounded))
            }
            
            Section("Notes") {
                TextEditor(text: .constant("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque pulvinar, augue vel viverra rhoncus, felis risus dapibus mauris, in feugiat elit urna et odio. Integer eros enim, ornare sit amet placerat ac, vulputate sit amet eros. Sed tristique feugiat diam. Phasellus et tortor gravida, iaculis augue sed, elementum diam. In quis diam condimentum est mattis posuere. Proin ut turpis arcu. Donec blandit magna odio, non tincidunt sem volutpat ac. Nunc convallis ante sed bibendum tempor. Fusce viverra orci id enim consequat aliquet.")).foregroundColor(Color.gray)
            }
        }
        .navigationTitle("Name Here")
        .toolbar{
            ToolbarItem(placement: .confirmationAction){
                Button("Done"){
                    dismiss()
                }
            }
            ToolbarItem(placement: .cancellationAction){
                Button("Cancel"){
                    dismiss()
                }
            }
        }
        .frame(minWidth: 700, minHeight: 500)
    }
}

struct CreateRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            CreateRecipeView()
        }
    }
}
