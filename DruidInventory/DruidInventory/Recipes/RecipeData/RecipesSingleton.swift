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

    private init() {
        self.recipes = testArray()
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
}
