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
    weak var delegateToPotions: RecipeContainerAmountDelegate?

    private var recipes = [Recipe]() {
        didSet {
            encodeAndSave()
        }
    }

    var usedComponents = [UUID]()

    var filteredComponents = [Potion]()

    let recipesFile = FileManager().getFilePath("recipesJSON.txt")

    private init() {
        self.filteredComponents = PotionContainer.shared.getAllPotions()
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
            delegateToPotions?.changedPotionAmount(id: potion.id, amount: potion.amount)

        }

        for ingredient in recipe.ingredientsInRecipe {
            delegateToPotions?.changedPotionAmount(id: ingredient.id, amount: -ingredient.amount)
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

    func filterComponents(recipe: Recipe) {
        usedComponents = []

        for ingredient in recipe.ingredientsInRecipe {
            usedComponents.append(ingredient.id)
        }

        for potion in recipe.potionsInRecipe {
            usedComponents.append(potion.id)
        }
        let potions = PotionContainer.shared.getAllPotions()
        filteredComponents = potions.filter {!usedComponents.contains($0.id)}
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
