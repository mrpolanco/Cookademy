//
//  ContentView.swift
//  Cookademy
//
//  Created by Rich Polanco on 3/17/23.
//

import SwiftUI

struct RecipesListView: View {
    @EnvironmentObject private var recipeData: RecipeData
    let category: MainInformation.Category

    var body: some View {
        List {
            ForEach(recipes) { recipe in
                Text(recipe.mainInformation.name)
            }

        }
        .navigationTitle(navigationTitle)
    }
}

extension RecipesListView {
    func recipes(for category: MainInformation.Category) -> [Recipe] {
        var filteredRecipes = [Recipe]()
        for recipe in recipeData.recipes {
            if recipe.mainInformation.category == category {
                filteredRecipes.append(recipe)
            }
        }
        return filteredRecipes
    }

    private var recipes: [Recipe] {
        recipes(for: category)
    }

    private var navigationTitle: String {
        "\(category.rawValue) Recipes"
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecipesListView(category: .breakfast)
                .environmentObject(RecipeData())
        }
    }
}
