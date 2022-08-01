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
    weak var delegateToPotions: RecipeContainerPotionsDelegate?

    private var recipes = [Recipe]() {
        didSet {
            encodeAndSave()
        }
    }

    let recipesFile = FileManager().getFilePath("recipesJSON.txt")

    private init() {
        loadAndDecode()
    }

    private func findRecipeIndex(id: UUID) -> Int {
        guard let index = recipes.firstIndex(
            where: {$0.id == id}) else {
            fatalError("No such potion found")
        }
        return index
    }

    func findRecipe(id: UUID) -> Recipe? {
        guard let index = recipes.firstIndex(
            where: {$0.id == id}) else {
            fatalError("No such potion found")
        }

        return recipes[index]
    }

    func getAllRecipes() -> [Recipe] {
        return recipes
    }

    func addRecipe(recipe: Recipe) {
        recipes.append(recipe)
        delegate?.addedNewRecipe()
    }

    func changeRecipe(recipe: Recipe) {
        recipes[findRecipeIndex(id: recipe.id)] = recipe
        delegate?.editedRecipe(id: recipe.id)
    }

    func deleteRecipe(id: UUID) {
        let index = findRecipeIndex(id: id)
        recipes.remove(at: index)
        delegate?.deletedRecipe(id: id)
    }

    func createPotion(recipe: Recipe) {
        for potion in recipe.potionsInRecipe {
            let potions = PotionContainer.shared.getAllPotions()
            if potions.contains(where: {$0.id == potion.id}) {
                delegateToPotions?.updatedPotionAmount(id: potion.id, amount: potion.amount)
            } else {
                delegateToPotions?.createdNewPotion(potion: potion)
            }
        }

        for ingredient in recipe.ingredientsInRecipe {
            delegateToPotions?.updatedPotionAmount(id: ingredient.id, amount: -ingredient.amount)
        }
        delegate?.createdPotion(ingredients: recipe.ingredientsInRecipe)
    }
}

extension RecipesContainer {

    func checkIngredients(ingredients: [Potion]) -> Bool {
        var validationArray = [Bool]()
        for ingredient in ingredients {
            if let potion = PotionContainer.shared.findPotion(id: ingredient.id) {
                validationArray.append( potion.amount >= ingredient.amount )
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

    func encodeAndSave() {
        do {
            let recipesJSON = try JSONEncoder().encode(recipes)
            try recipesJSON.write(to: recipesFile, options: .atomic)
        } catch {
            print("Error occured during saving file")
        }
    }

    func loadAndDecode() {
        do {
            let response = try String(contentsOf: recipesFile)
            let data = Data(response.utf8)
            self.recipes = try JSONDecoder().decode([Recipe].self, from: data)
        } catch {
            print("Error occured during loading file")
            self.recipes = initialRecipes()
        }
    }
}

extension RecipesContainer: PotionsContainerUpdateDelegate {

    func potionNameUpdated(id: UUID, name: String) {
        for (recipeIndex, recipe) in recipes.enumerated() {

            if let index = recipe.ingredientsInRecipe.firstIndex(where: {$0.id == id}) {
                self.recipes[recipeIndex].ingredientsInRecipe[index].name = name
            }

            if let index = recipe.potionsInRecipe.firstIndex(where: {$0.id == id}) {
                self.recipes[recipeIndex].potionsInRecipe[index].name = name
            }
        }
    }

    func potionImageUpdated(id: UUID, image: String) {
        for (recipeIndex, recipe) in recipes.enumerated() {

            if let index = recipe.ingredientsInRecipe.firstIndex(where: {$0.id == id}) {
                self.recipes[recipeIndex].ingredientsInRecipe[index].image = image
            }

            if let index = recipe.potionsInRecipe.firstIndex(where: {$0.id == id}) {
                self.recipes[recipeIndex].potionsInRecipe[index].image = image
            }
        }
    }
}
