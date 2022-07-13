//
//  RecipeComponentSelectorController+Methods.swift
//  DruidInventory
//
//  Created by Patrick on 07.07.2022..
//

import UIKit

extension RecipeComponentSelectorViewController {

    @objc func nextOnTap() {
        potionIndex += 1
        if potionIndex > RecipesContainer.shared.filteredComponents.count - 1 {
            potionIndex = 0
        }
        potion = RecipesContainer.shared.filteredComponents[potionIndex]
    }

    @objc func previousOnTap() {
        potionIndex -= 1
        if potionIndex < 0 {
            potionIndex = RecipesContainer.shared.filteredComponents.count - 1
        }

        potion = RecipesContainer.shared.filteredComponents[potionIndex]
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
        case .inputChange:
            if let index = recipe.ingredientsInRecipe.firstIndex(where: {$0.id == potion.id}) {
                componentRecipeIndex = index
            }
        case .outputChange:
            if let index = recipe.potionsInRecipe.firstIndex(where: {$0.id == potion.id}) {
                componentRecipeIndex = index
            }
        }
    }
}
