//
//  MainTabView.swift
//  Cookademy
//
//  Created by Rich Polanco on 8/19/23.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var recipeData = RecipeData()

    var body: some View {
        TabView {
            RecipeCategoryGridView()
                .tabItem { Label("Recipes", systemImage: "list.dash")}
            NavigationStack {
                RecipesListView(category: .breakfast)
            }.tabItem { Label("Favorites", systemImage: "heart.fill")}
        }
        .environmentObject(recipeData)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
