//
//  RecipesSingleton.swift
//  DruidInventory
//
//  Created by Patrick on 07.07.2022..
//

import UIKit

class RecipesContainer {
    static let shared = RecipesContainer()

    weak var delegate: RecipesContainerDelegate?

    var recipes = [Recipe]()

    var usedComponents = [UUID]()

    var filteredComponents = [Potion]()

    private init() {
//        self.recipes = testArray()
        self.filteredComponents = PotionContainer.shared.potions
    }

    func addRecipe(recipe: Recipe) {
        RecipesContainer.shared.recipes.append(recipe)
        delegate?.appendToTableView()
    }

    func changeRecipe(recipe: Recipe, indexPath: IndexPath) {
        RecipesContainer.shared.recipes[indexPath.row] = recipe
        delegate?.reloadTableViewRow(indexPath: indexPath)
    }

    func deleteRecipe(indexPath: IndexPath) {
        RecipesContainer.shared.recipes.remove(at: indexPath.row)
        delegate?.deleteTableRow(indexPath: indexPath)
    }

    func reloadRecipe(indexPath: IndexPath) {
        delegate?.reloadTableViewRow(indexPath: indexPath)
    }

    func createPotion(recipe: Recipe, recipeIndexPath: IndexPath) {
        for potion in recipe.potionsInRecipe {
            if let index = PotionContainer.shared.potions.firstIndex(where: {$0.id == potion.id}) {
                PotionContainer.shared.addToPotionsByRecipe(amount: potion.amount, index: index)
            }
        }

        for ingredient in recipe.ingredientsInRecipe {
            if let index = PotionContainer.shared.potions.firstIndex(where: {$0.id == ingredient.id}) {
                PotionContainer.shared.removeFromPotionsByRecipe(amount: ingredient.amount, index: index)
            }
        }
        delegate?.reloadTableViewRow(indexPath: recipeIndexPath)
    }

    func checkIngredients(ingredients: [Potion]) -> Bool {
        var validationArray = [Bool]()
        for ingredient in ingredients {
            if let index = PotionContainer.shared.potions.firstIndex(where: {$0.id == ingredient.id}) {
                validationArray.append( PotionContainer.shared.potions[index].amount >= ingredient.amount )
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
            usedComponents.append(ingredient.id)
        }

        for potion in recipe.potionsInRecipe {
            usedComponents.append(potion.id)
        }

        filteredComponents = PotionContainer.shared.potions.filter {!usedComponents.contains($0.id)}
    }
}
