//
//  RecipeComponentSelectorController+Methods.swift
//  DruidInventory
//
//  Created by Patrick on 07.07.2022..
//

import UIKit

extension RecipeComponentSelectorController {

    @objc func nextOnTap() {
        potionIndex += 1
        if potionIndex > PotionSingleton.shared.potions.count - 1 {
            potionIndex = 0
        }
        potion = PotionSingleton.shared.potions[potionIndex]
    }

    @objc func previousOnTap() {
        potionIndex -= 1
        if potionIndex < 0 {
            potionIndex = PotionSingleton.shared.potions.count - 1
        }

        potion = PotionSingleton.shared.potions[potionIndex]
    }

    @objc func addOnTap() {
        newPotion.amount += 1
    }

    @objc func removeOnTap() {
        newPotion.amount -= 1
    }

    @objc func addNewOnTap() {
        delegate?.appendNewIngredient(
            component: newPotion,
            componentType: componentType,
            componentIndexPath: ingredientIndexPath)
        self.dismiss(animated: true)
    }
}
