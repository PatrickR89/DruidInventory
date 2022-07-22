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
    weak var delegate: OnlineRecipeDelegate?

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

    func addOnlineRecipe(recipe: Recipe) {
        var tempRecipe = recipe
        tempRecipe.local = false
        onlineRecipes.append(tempRecipe)
        delegate?.recipeDidUpload()
    }

    func validateRecipe(recipe: Recipe, validationRecipes: [Recipe]) -> Bool {
        var validationArray = [Bool]()

        for validationRecipe in validationRecipes {
            var validateByRecipe = [Bool]()
            for ingredient in recipe.ingredientsInRecipe {
                validateByRecipe.append( validationRecipe.ingredientsInRecipe.contains(
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

    func downloadRecipe(recipe: Recipe) {
        let potions = PotionContainer.shared.getAllPotions()
        var tempRecipe = Recipe(
            id: recipe.id,
            local: recipe.local,
            ingredientsInRecipe: recipe.ingredientsInRecipe,
            potionsInRecipe: recipe.potionsInRecipe)

        tempRecipe.ingredientsInRecipe = recipe.ingredientsInRecipe.map { (ingredient) -> Potion in
            var tempIngredient = Potion(
                name: ingredient.name,
                image: ingredient.image,
                amount: ingredient.amount,
                id: ingredient.id )
            if let index = potions.firstIndex(where: {$0.name == ingredient.name && $0.image == ingredient.image}) {
                tempIngredient.id = potions[index].id
            }
            return tempIngredient
        }

        tempRecipe.potionsInRecipe = recipe.potionsInRecipe.map { (potion) -> Potion in
            var tempPotion = Potion(
                name: potion.name,
                image: potion.image,
                amount: potion.amount,
                id: potion.id )
            if let index = potions.firstIndex(where: {$0.name == potion.name && $0.image == potion.image}) {
                tempPotion.id = potions[index].id
            }
            return tempPotion
        }

        RecipesContainer.shared.addRecipe(recipe: tempRecipe)
        delegate?.recipeDidDownload(id: tempRecipe.id)
    }
}
