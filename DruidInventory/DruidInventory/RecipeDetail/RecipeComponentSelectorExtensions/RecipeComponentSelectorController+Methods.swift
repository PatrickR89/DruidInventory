//
//  RecipeComponentSelectorController+Methods.swift
//  DruidInventory
//
//  Created by Patrick on 07.07.2022..
//

import UIKit

extension RecipeComponentSelectorViewController {

    @objc func nextOnTap() {
        if filteredComponents.count > 1 {
            potionIndex += 1
            if potionIndex > filteredComponents.count - 1 {
                potionIndex = 0
            }
            potion = filteredComponents[potionIndex]
        }
    }

    @objc func previousOnTap() {
        if filteredComponents.count > 1 {
            potionIndex -= 1
            if potionIndex < 0 {
                potionIndex = filteredComponents.count - 1
            }

            potion = filteredComponents[potionIndex]
        }
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
            componentIndexPath: componentIndexPath)
        self.dismiss(animated: true)
    }

    func editComponentOnChange() {
        delegate?.editExistingComponent(
            component: newPotion,
            componentType: componentType,
            componentIndexPath: componentIndexPath,
            componentRecipeIndex: componentRecipeIndex
        )
    }

    func setupRecipe(recipe: Recipe, potion: Potion) {
        switch componentType {
        case .inputNew, .outputNew:
            componentRecipeIndex = 0
            buttonTitle = "BACK"
        case .inputChange:
            if let index = recipe.ingredientsInRecipe.firstIndex(where: {$0.id == potion.id}) {
                componentRecipeIndex = index
            }
            buttonTitle = "DONE"
        case .outputChange:
            if let index = recipe.potionsInRecipe.firstIndex(where: {$0.id == potion.id}) {
                componentRecipeIndex = index
            }
            buttonTitle = "DONE"
        }
    }
}
