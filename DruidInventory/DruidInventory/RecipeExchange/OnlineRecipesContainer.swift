//
//  OnlineRecipesContainer.swift
//  DruidInventory
//
//  Created by Patrick on 22.07.2022..
//

import UIKit

class OnlineRecipesContainer {
    static let shared = OnlineRecipesContainer()

    private var cachedRecipes = [Recipe]()
    weak var delegate: OnlineRecipeDelegate?

    private init () {
        cachedRecipes = setupBasicRecipes()
    }

    func getAllOnlineRecipes() -> [Recipe] {
        return cachedRecipes
    }

    func findRecipe(id: UUID) -> Recipe? {
        guard let index = cachedRecipes.firstIndex(
            where: {$0.id == id}) else {
            fatalError("No such potion found")
        }

        return cachedRecipes[index]
    }

    func addOnlineRecipe(recipe: Recipe) {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            var tempRecipe = recipe
            tempRecipe.local = false
            self?.cachedRecipes.append(tempRecipe)
            
            DispatchQueue.main.async {
                self?.delegate?.recipeDidUpload()
            }

            return
        }
    }
}
