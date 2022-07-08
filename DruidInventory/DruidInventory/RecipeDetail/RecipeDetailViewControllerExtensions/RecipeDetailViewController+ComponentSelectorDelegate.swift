//
//  RecipeDetailViewController+ComponentSelectorDelegate.swift
//  DruidInventory
//
//  Created by Patrick on 07.07.2022..
//

import UIKit

extension RecipeDetailViewController: RecipeComponentSelectorDelegate {

    func editExistingComponent(
        component: Potion,
        componentType: RecipeComponentType,
        componentIndexPath: IndexPath,
        componentRecipeIndex: Int) {
            switch componentType {
            case .inputNew, .outputNew:
                return
            case .inputChange:
                recipe.ingredientsInRecipe[componentRecipeIndex] = component
            case .outputChange:
                recipe.potionsInRecipe[componentRecipeIndex] = component
            }
            tableContents[componentIndexPath.row] = RecipeDetailViewController.TableRowContent.component(
                name: component.name,
                image: component.image,
                count: component.amount)
            tableView.reloadRows(at: [componentIndexPath], with: .none)

        }

    func appendNewIngredient(component: Potion, componentType: RecipeComponentType, componentIndexPath: IndexPath) {

        switch componentType {
        case .inputNew:
            recipe.ingredientsInRecipe.append(component)

            if recipe.ingredientsInRecipe.count >= 4 {
                tableContents.remove(at: componentIndexPath.row)
                tableView.deleteRows(at: [componentIndexPath], with: .none)
            }

        case .outputNew:
            recipe.potionsInRecipe.append(component)

            if recipe.potionsInRecipe.count >= 2 {
                tableContents.remove(at: componentIndexPath.row)
                tableView.deleteRows(at: [componentIndexPath], with: .none)
            }

        default:
            print("error, unknown component type")
        }

        tableContents.insert( RecipeDetailViewController.TableRowContent.component(
            name: component.name,
            image: component.image,
            count: component.amount), at: componentIndexPath.row)
        tableView.insertRows(at: [componentIndexPath], with: .none)
    }
}
