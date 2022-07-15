//
//  RecipesContainerToPotionsContainerDelegate.swift
//  DruidInventory
//
//  Created by Patrick on 15.07.2022..
//

import UIKit

protocol RecipeContainerAmountDelegate: AnyObject {

    func updatedPotionAmount(id: UUID, amount: Int)
}
