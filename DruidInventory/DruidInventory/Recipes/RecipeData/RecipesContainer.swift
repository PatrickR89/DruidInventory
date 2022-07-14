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

    var recipes = [Recipe]() {
        didSet {
            encodeAndSave()
        }
    }

    var usedComponents = [UUID]()

    var filteredComponents = [Potion]()

    let recipesFile = FileManager().getFilePath("recipesJSON.txt")

    private init() {
        self.filteredComponents = PotionContainer.shared.potions
        loadAndDecode()
    }

    func addRecipe(recipe: Recipe) {
        RecipesContainer.shared.recipes.append(recipe)
        delegate?.addedNewRecipe()
    }

    func changeRecipe(recipe: Recipe, indexPath: IndexPath) {
        RecipesContainer.shared.recipes[indexPath.row] = recipe
        delegate?.editedRecipe(indexPath: indexPath)
    }

    func deleteRecipe(indexPath: IndexPath) {
        RecipesContainer.shared.recipes.remove(at: indexPath.row)
        delegate?.deletedRecipe(indexPath: indexPath)
    }

    func reloadRecipe(indexPath: IndexPath) {
        delegate?.editedRecipe(indexPath: indexPath)
    }

    func createPotion(recipe: Recipe, recipeIndexPath: IndexPath) {
        for potion in recipe.potionsInRecipe {
                PotionContainer.shared.createFromRecipe(amount: potion.amount, id: potion.id)
        }

        for ingredient in recipe.ingredientsInRecipe {
                PotionContainer.shared.spendOnRecipe(amount: ingredient.amount, id: ingredient.id)
        }
        delegate?.editedRecipe(indexPath: recipeIndexPath)
    }
}

extension RecipesContainer {

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
