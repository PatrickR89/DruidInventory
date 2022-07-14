//
//  RecipeDelegate.swift
//  DruidInventory
//
//  Created by Patrick on 08.07.2022..
//

import UIKit

protocol RecipesContainerDelegate: AnyObject {
    func addedNewRecipe()
    func editedRecipe(indexPath: IndexPath)
    func deletedRecipe(indexPath: IndexPath)
    func createdPotion(ingredients: [Potion])
}
