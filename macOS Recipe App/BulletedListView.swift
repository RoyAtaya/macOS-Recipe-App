//
//  BulletedListView.swift
//  macOS Recipe App
//
//  Created by Roy Ataya on 2023-06-04.
//

import SwiftUI

struct BulletedListView: View {
    var ingredient: String = ""
    
    init(ingredient: String) {
        self.ingredient = ingredient
    }
    
    var body: some View {
        VStack(alignment:.leading){
            Text("•\t" + ingredient)
                .font(.system(size:15, design: .rounded))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct BulletedListView_Previews: PreviewProvider {
    static var previews: some View {
        BulletedListView(ingredient: "chocolate")
    }
}
