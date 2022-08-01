//
//  OnlineRecipes+InitialRecipes.swift
//  DruidInventory
//
//  Created by Patrick on 01.08.2022..
//

import UIKit

extension OnlineRecipesContainer {
    func setupBasicRecipes() -> [Recipe] {
        var recipes = [Recipe]()

        let potions = PotionContainer.shared.getAllPotions()
        var potion1 = potions[0]
        potion1.amount = 1
        potion1.id = UUID()
        var potion2 = potions[1]
        potion2.amount = 2
        potion2.id = UUID()
        var potion3 = potions[2]
        potion3.amount = 1
        potion3.id = UUID()
        var potion4 = potions[3]
        potion4.amount = 3
        potion4.id = UUID()
        var potion5 = potions[4]
        potion5.amount = 2
        potion5.id = UUID()
        var potion6 = potions[5]
        potion6.amount = 1
        potion6.id = UUID()
        let onlinePotion1 = Potion(name: "Night Vision", image: "eyeglasses", amount: 2, id: UUID())
        let onlinePotion2 = Potion(name: "Furry", image: "arrowtriangle.backward", amount: 1, id: UUID())
        let onlinePotion3 = Potion(name: "Steel skin", image: "strikethrough", amount: 1, id: UUID())
        let onlinePotion4 = Potion(name: "Guardian", image: "shield.righthalf.filled", amount: 3, id: UUID())
        let onlinePotion5 = Potion(name: "Fire resistance", image: "flame", amount: 2, id: UUID())

        recipes.append( Recipe(
            id: UUID(),
            local: false,
            ingredientsInRecipe:
                [potion1,
                 potion3],
            potionsInRecipe:
                [potion2]))

        recipes.append(
            Recipe(
                id: UUID(),
                local: false,
                ingredientsInRecipe:
                    [potion2,
                     potion5,
                     potion4,
                     potion3],
                potionsInRecipe:
                    [potion1,
                     potion6]))
        recipes.append(
            Recipe(
                id: UUID(),
                local: false,
                ingredientsInRecipe:
                    [potion2,
                     potion5,
                     onlinePotion3,
                     onlinePotion5],
                potionsInRecipe:
                    [potion1,
                     potion6]))
        recipes.append(
            Recipe(
                id: UUID(),
                local: false,
                ingredientsInRecipe:
                    [onlinePotion2,
                     onlinePotion4,
                     potion3],
                potionsInRecipe:
                    [onlinePotion1]))
        recipes.append(
            Recipe(
                id: UUID(),
                local: false,
                ingredientsInRecipe:
                    [potion1,
                     potion4,
                     onlinePotion4],
                potionsInRecipe:
                    [onlinePotion2]))
        recipes.append(
            Recipe(
                id: UUID(),
                local: false,
                ingredientsInRecipe:
                    [potion2,
                     onlinePotion1,
                     potion3],
                potionsInRecipe:
                    [potion1]))

        return recipes
    }
}
