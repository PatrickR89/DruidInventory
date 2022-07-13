//
//  RecipeDetailViewController+Delegate.swift
//  DruidInventory
//
//  Created by Patrick on 28.06.2022..
//

import UIKit

extension RecipeDetailViewController {

    func configTableViewLayout() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white

        RecipeDetailComponentCell.register(in: tableView)
        RecipeDetailPlusCell.register(in: tableView)
        RecipeDetailResultsInCell.register(in: tableView)
        RecipeDetailMakeButtonCell.register(in: tableView)
    }

    func appendPlusButtons() {
        if recipe.ingredientsInRecipe.count < 4 {
            tableContents.insert(.plusButton(type: .inputNew), at: 0)
        }

        if recipe.potionsInRecipe.count < 2 {
            if let index = tableContents.firstIndex(of: RecipeDetailViewController.TableRowContent.downArrow) {
                tableContents.insert(.plusButton(type: .outputNew), at: index + 1)
            }
        }
    }

    func validateRecipe() {
        isRecipeValid = recipe.ingredientsInRecipe.count >= 2 && recipe.potionsInRecipe.count >= 1
    }

    // MARK: tableContents & recipe components manipulation

    func appendItemsToContent() {

        for ingredient in recipe.ingredientsInRecipe {
            tableContents.insert(
                RecipeDetailViewController.TableRowContent.component(
                    name: ingredient.name,
                    image: ingredient.image,
                    count: ingredient.amount),
                at: 0)
        }

        if let index = tableContents.firstIndex(of: RecipeDetailViewController.TableRowContent.downArrow) {
            for potion in recipe.potionsInRecipe {
                tableContents.insert(
                    RecipeDetailViewController.TableRowContent.component(
                        name: potion.name,
                        image: potion.image,
                        count: potion.amount),
                    at: index + 1)
            }
        }
    }

    func recipeComponentManipulation(
        type: RecipeComponentType,
        recipe: Recipe,
        component: Potion,
        componentIndexPath: IndexPath) {

            let recipeComponentSelector = RecipeComponentSelectorViewController(
                componentIndexPath: componentIndexPath,
                type: type, potion: component)
            recipeComponentSelector.delegate = self

            recipeComponentSelector.setupRecipe(recipe: recipe, potion: component)
            present(recipeComponentSelector, animated: true)
        }

    func removeComponent(
        type: RecipeComponentType,
        component: Potion,
        recipeIndexPath: IndexPath,
        componentIndexPath: IndexPath) {

            getIndex(type: type, component: component)

            if let index = tableContents.firstIndex(
                where: {$0.self == TableRowContent.component(
                    name: component.name,
                    image: component.image,
                    count: component.amount)}) {

                tableContents.remove(at: index)
                tableView.deleteRows(at: [componentIndexPath], with: .none)
            }

            appendPlusButton(type: type)

        }

    // MARK: removeComponent internal functions

    func getIndex(type: RecipeComponentType, component: Potion) {
        switch type {
        case .inputChange:
            if let index = recipe.ingredientsInRecipe.firstIndex(where: {$0.name == component.name}) {
                recipe.ingredientsInRecipe.remove(at: index)
            }
        case .outputChange:
            if let index = recipe.potionsInRecipe.firstIndex(where: {$0.name == component.name}) {
                recipe.potionsInRecipe.remove(at: index)
            }
        default:
            return
        }
    }

    func appendPlusButton(type: RecipeComponentType) {
        switch type {
        case .inputChange:
            if recipe.ingredientsInRecipe.count == 3 {
                if let index = tableContents.firstIndex(
                    of: RecipeDetailViewController.TableRowContent.downArrow) {
                    tableContents.insert(.plusButton(type: .inputNew), at: index)
                    let indexPath = IndexPath(row: index, section: tableView.numberOfSections - 1)
                    tableView.insertRows(at: [indexPath], with: .none)
                }
            }
        case .outputChange:
            if recipe.potionsInRecipe.count == 1 {
                if let index = tableContents.firstIndex(
                    of: RecipeDetailViewController.TableRowContent.makeButton) {
                    tableContents.insert(.plusButton(type: .inputNew), at: index)
                    let indexPath = IndexPath(row: index, section: tableView.numberOfSections - 1)
                    tableView.insertRows(at: [indexPath], with: .none)
                }
            }
        default:
            return
        }
    }

    // MARK: removeComponent internal functions END

}
