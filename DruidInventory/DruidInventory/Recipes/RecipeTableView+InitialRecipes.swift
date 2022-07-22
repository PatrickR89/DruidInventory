//
//  RecipeTableView+InitialRecipes.swift
//  DruidInventory
//
//  Created by Patrick on 28.06.2022..
//

import UIKit

extension RecipesContainer {
    func initialRecipes() -> [Recipe] {
        var recipes = [Recipe]()

        let potions = PotionContainer.shared.getAllPotions()
        var potion1 = potions[0]
        potion1.amount = 1
        var potion2 = potions[1]
        potion2.amount = 2
        var potion3 = potions[2]
        potion3.amount = 1
        var potion4 = potions[3]
        potion4.amount = 3
        var potion5 = potions[4]
        potion5.amount = 2
        var potion6 = potions[5]
        potion6.amount = 1

        recipes.append( Recipe(
            id: UUID(),
            local: true,
            ingredientsInRecipe:
                [potion1,
                 potion3],
            potionsInRecipe:
                [potion2]))

        recipes.append(
            Recipe(
                id: UUID(),
                local: true,
                ingredientsInRecipe:
                    [potion2,
                     potion5,
                     potion4,
                     potion3],
                potionsInRecipe:
                    [potion1,
                     potion6]))

        return recipes
    }
}
