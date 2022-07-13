//
//  RecipeDelegate.swift
//  DruidInventory
//
//  Created by Patrick on 08.07.2022..
//

import UIKit

protocol RecipesContainerDelegate: AnyObject {
    func addNewRecipe()
    func editRecipe(indexPath: IndexPath)
    func deleteRecipe(indexPath: IndexPath)
}
