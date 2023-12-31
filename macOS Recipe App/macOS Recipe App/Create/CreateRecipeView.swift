//
//  CreateRecipeView.swift
//  macOS Recipe App
//
//  Created by Roy Ataya

import SwiftUI

struct CreateRecipeView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: EditRecipeViewModel
    @State private var hasError: Bool = false
    
    var body: some View {
        List{
            Section(header: Text("General").font(.system(size: 20, design: .rounded).bold())){
                Form {
                    TextField(text: $viewModel.recipe.name, prompt: Text("recipe name")) {
                        Text("Recipe Name:")
                    }
                }.font(.system(size: 15, design: .rounded))
                Toggle("Favourite", isOn: $viewModel.recipe.favourite)
                .toggleStyle(.switch)
                .font(.system(size: 15, design: .rounded))
            }
            Section(header: Text("Ingredients").font(.system(size: 20, design: .rounded).bold())){
                TextEditor(text: $viewModel.recipe.ingredients)
                    .scrollContentBackground(.hidden)
                    .background(Color.primary.colorInvert())
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                        .stroke(.black, lineWidth: 1 / 3)
                        .opacity(0.3))
                    .foregroundColor(Color.gray)
                    .font(.system(size: 15, design: .rounded))
            }
            Section(header: Text("Steps").font(.system(size: 20, design: .rounded).bold())){
                TextEditor(text: $viewModel.recipe.steps)
                    .scrollContentBackground(.hidden)
                    .background(Color.primary.colorInvert())
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                        .stroke(.black, lineWidth: 1 / 3)
                        .opacity(0.3))
                    .foregroundColor(Color.gray)
                    .font(.system(size: 15, design: .rounded))
            }
            
            Section(header: Text("Notes").font(.system(size: 20, design: .rounded).bold())) {
                TextEditor(text: $viewModel.recipe.notes)
                    .scrollContentBackground(.hidden)
                    .background(Color.primary.colorInvert())
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                        .stroke(.black, lineWidth: 1 / 3)
                        .opacity(0.3))
                    .foregroundColor(Color.gray)
                    .font(.system(size: 15, design: .rounded))
            }
        }
        .navigationTitle(viewModel.isNew ? "New Recipe": "Update Recipe")
        .toolbar{
            ToolbarItem(placement: .confirmationAction){
                Button("Done"){
                    validate()
                }
            }
            ToolbarItem(placement: .cancellationAction){
                Button("Cancel"){
                    dismiss()
                }
            }
        }
        .alert("Something is not right", isPresented: $hasError, actions: {}){
            Text("It looks like your form is invalid!\nMake sure you have added a recipe name, the ingredients and the steps to make the recipe")
        }
        .frame(minWidth: 700, minHeight: 500)
    }
}

private extension CreateRecipeView{
    func validate(){
        if viewModel.recipe.isValid{
            do{
                try viewModel.save()
                dismiss()
            }catch{
                print(error)
            }
        }else{
            hasError = true
        }
    }
}

struct CreateRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            let preview = RecipeProvider.shared
            CreateRecipeView(viewModel: .init(provider: preview))
                .environment(\.managedObjectContext, preview.viewContext)
        }
    }
}
