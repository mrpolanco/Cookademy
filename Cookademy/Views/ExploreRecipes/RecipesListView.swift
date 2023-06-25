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

    @State private var isPresenting = false
    @State private var newRecipe = Recipe()

    var body: some View {
        NavigationStack {
            List {
                ForEach(recipes) { recipe in
                    Text(recipe.mainInformation.name)
                }

            }
            .navigationTitle(navigationTitle)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isPresenting = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            })
            .sheet(isPresented: $isPresenting, content: {
                NavigationStack {
                    ModifyRecipeView(recipe: $newRecipe)
                        .toolbar(content: {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Dismiss") {
                                    isPresenting = false
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                if newRecipe.isValid {
                                    Button("Add") {
                                        recipeData.add(recipe: newRecipe)
                                        isPresenting = false
                                    }
                                }
                            }
                        })
                        .navigationTitle("Add a New Recipe")
                }
            })
        }
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
