//
//  RecipeTableView+Test.swift
//  DruidInventory
//
//  Created by Patrick on 28.06.2022..
//

import UIKit

extension RecipesSingleton {
    func testArray() -> [Recipe] {
        var recipes = [Recipe]()

        let ingredient1 = Potion(name: "Cocoa", image: "hourglass.bottomhalf.filled", amount: 5)
        let ingredient2 = Potion(name: "Saw Dust", image: "paperplane.circle", amount: 2)
        let ingredient3 = Potion(name: "Fairy blood", image: "drop.triangle", amount: 1)
        let potion1 = Potion(name: "Unseen", image: "eyeglasses", amount: 1)
        recipes.append(Recipe(ingredientsInRecipe: [ingredient1, ingredient2, ingredient3], potionsInRecipe: [potion1]))

        let ingredientAd = Potion(name: "Nightshade", image: "staroflife.fill", amount: 2)
        let ingredientAa = Potion(name: "Bamboocha", image: "zzz", amount: 1)
        let ingredientAb = Potion(name: "Iron dust", image: "square.stack.3d.forward.dottedline", amount: 1)
        let ingredientAc = Potion(
            name: "Mushroom juice",
            image: "eye.trianglebadge.exclamationmark.fill",
            amount: 6)
        let potionAa = Potion(name: "Night Walk", image: "eye", amount: 1)
        let potionAb = Potion(name: "Bear Poison", image: "exclamationmark.octagon.fill", amount: 1)
        recipes.append(
            Recipe(
                ingredientsInRecipe: [ingredientAa, ingredientAb, ingredientAc, ingredientAd],
                potionsInRecipe: [potionAa, potionAb]))
        recipes.append(Recipe(ingredientsInRecipe: [ingredientAa, ingredientAb], potionsInRecipe: [potionAa, potionAb]))
        recipes.append(Recipe(ingredientsInRecipe: [ ingredientAc, ingredientAd], potionsInRecipe: [potionAb]))

        return recipes
    }
}
