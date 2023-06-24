//
//  RecipeCategoryGridView.swift
//  Cookcademy
//
//  Created by Rich Polanco on 6/23/23.
//

import SwiftUI

struct RecipeCategoryGridView: View {
    private var recipeData = RecipeData()

    var body: some View {
        NavigationView {
            LazyVGrid(columns: [GridItem()], content: {
                ForEach(MainInformation.Category.allCases, id: \.self) { category in
                    Text(category.rawValue)
                        .font(.title)
                }
            })
            .navigationTitle("Categories")
        }
    }
}

struct RecipeCategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCategoryGridView()
    }
}
