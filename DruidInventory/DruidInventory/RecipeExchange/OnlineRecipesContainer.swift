//
//  OnlineRecipesContainer.swift
//  DruidInventory
//
//  Created by Patrick on 22.07.2022..
//

import UIKit

class OnlineRecipesContainer {
    static let shared = OnlineRecipesContainer()

    private var onlineRecipes = [Recipe]()

    private init () {
        onlineRecipes = setupBasicRecipes()
    }

    func getAllOnlineRecipes() -> [Recipe] {
        return onlineRecipes
    }

    func findRecipe(id: UUID) -> Recipe? {
        guard let index = onlineRecipes.firstIndex(
            where: {$0.id == id}) else {
            fatalError("No such potion found")
        }

        return onlineRecipes[index]
    }

    func validateRecipe(recipe: Recipe) -> Bool {
        let localRecipes = RecipesContainer.shared.getAllRecipes()
        var validationArray = [Bool]()

        for localRecipe in localRecipes {
            var validateByRecipe = [Bool]()
            for ingredient in recipe.ingredientsInRecipe {
                validateByRecipe.append( localRecipe.ingredientsInRecipe.contains(
                    where: {$0.name == ingredient.name && $0.image == ingredient.image}))
            }

            if validateByRecipe.contains(false) {
                validationArray.append(false)
            } else {
                validationArray.append(true)
            }
        }
        return validationArray.contains(true)
    }
}
