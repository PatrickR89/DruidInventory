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

        RecipeDetailComponentCell.register(in: tableView)
        RecipeDetailPlusCell.register(in: tableView)
        RecipeDetailResultsInCell.register(in: tableView)
        RecipeDetailMakeButtonCell.register(in: tableView)
    }

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

    func recipeComponentManipulation(
        type: RecipeComponentType,
        recipe: Recipe,
        component: Potion,
        componentIndexPath: IndexPath) {

            let recipeComponentSelector = RecipeComponentSelectorController(
                componentIndexPath: componentIndexPath,
                type: type, potion: component)
            recipeComponentSelector.delegate = self

            switch type {
            case .inputNew, .outputNew:
                print("componentManipulation")
            case .inputChange, .outputChange:
                recipeComponentSelector.setupRecipe(recipe: recipe, potion: component)
            }
            present(recipeComponentSelector, animated: true)
        }
}
