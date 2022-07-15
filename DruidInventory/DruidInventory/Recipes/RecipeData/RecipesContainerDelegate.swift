//
//  RecipeDelegate.swift
//  DruidInventory
//
//  Created by Patrick on 08.07.2022..
//

import UIKit

protocol RecipesContainerDelegate: AnyObject {
    func addedNewRecipe()
    func editedRecipe(id: UUID)
    func deletedRecipe(id: UUID)
    func createdPotion(ingredients: [Potion])
}
