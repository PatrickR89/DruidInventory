//
//  RecipesSingleton.swift
//  DruidInventory
//
//  Created by Patrick on 07.07.2022..
//

import UIKit

class RecipesSingleton {
    static let shared = RecipesSingleton()

    weak var delegate: RecipesDelegate?

    var recipes = [Recipe]()

    var usedComponents = [String]()

    var filteredComponents = [Potion]()

    private init() {
        self.recipes = testArray()
        self.filteredComponents = PotionSingleton.shared.potions
    }

    func addRecipe(recipe: Recipe) {
        RecipesSingleton.shared.recipes.append(recipe)
        delegate?.appendToTableView()
    }

    func changeRecipe(recipe: Recipe, indexPath: IndexPath) {
        RecipesSingleton.shared.recipes[indexPath.row] = recipe
        delegate?.reloadTableViewRow(indexPath: indexPath)
    }

    func deleteRecipe(indexPath: IndexPath) {
        RecipesSingleton.shared.recipes.remove(at: indexPath.row)
        delegate?.deleteTableRow(indexPath: indexPath)
    }

    func reloadRecipe(indexPath: IndexPath) {
        delegate?.reloadTableViewRow(indexPath: indexPath)
    }

    func createPotion(recipe: Recipe, recipeIndexPath: IndexPath) {
        for potion in recipe.potionsInRecipe {
            if let index = PotionSingleton.shared.potions.firstIndex(where: {$0.name == potion.name}) {
                PotionSingleton.shared.addToPotionsByRecipe(amount: potion.amount, index: index)
            }
        }

        for ingredient in recipe.ingredientsInRecipe {
            if let index = PotionSingleton.shared.potions.firstIndex(where: {$0.name == ingredient.name}) {
                PotionSingleton.shared.removeFromPotionsByRecipe(amount: ingredient.amount, index: index)
            }
        }
        delegate?.reloadTableViewRow(indexPath: recipeIndexPath)
    }

    func checkIngredients(ingredients: [Potion]) -> Bool {
        var validationArray = [Bool]()
        for ingredient in ingredients {
            if let index = PotionSingleton.shared.potions.firstIndex(where: {$0.name == ingredient.name}) {
                validationArray.append( PotionSingleton.shared.potions[index].amount >= ingredient.amount )
            } else {
                validationArray.append(false)
            }
        }
        if validationArray.contains(false) || validationArray.isEmpty {
            return false
        } else {
            return true
        }
    }

    func filterComponents(recipe: Recipe) {
        usedComponents = []

        for ingredient in recipe.ingredientsInRecipe {
            usedComponents.append(ingredient.name)
        }

        for potion in recipe.potionsInRecipe {
            usedComponents.append(potion.name)
        }

        filteredComponents = PotionSingleton.shared.potions.filter {!usedComponents.contains($0.name)}
    }
}
