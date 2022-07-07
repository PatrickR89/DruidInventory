//
//  RecipeComponentSelectorDelegate.swift
//  DruidInventory
//
//  Created by Patrick on 07.07.2022..
//

import UIKit

protocol RecipeComponentSelectorDelegate: AnyObject {
    func appendNewIngredient(component: Potion, componentType: RecipeComponentType, componentIndexPath: IndexPath)
}
