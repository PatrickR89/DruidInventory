//
//  RecipesSingleton.swift
//  DruidInventory
//
//  Created by Patrick on 07.07.2022..
//

import UIKit

class RecipesSingleton {
    static let shared = RecipesSingleton()

    weak var delegate: RecipeDelegate?

    var recipes = [Recipe]()

    private init() {
        self.recipes = testArray()
    }

    func changeRecipe(recipe: Recipe, indexPath: IndexPath) {
        RecipesSingleton.shared.recipes[indexPath.row] = recipe
        delegate?.reloadTableViewRow(indexPath: indexPath)
    }
}
