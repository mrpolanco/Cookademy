//
//  RecipeData.swift
//  Cookademy
//
//  Created by Rich Polanco on 3/21/23.
//

import Foundation

class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
}
