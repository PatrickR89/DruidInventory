//
//  RecipeExchangeDetailViewTableViewController+Layout.swift
//  DruidInventory
//
//  Created by Patrick on 22.07.2022..
//

import UIKit

extension RecipeExchangeDetailTableViewController {
    func configTableViewLayout() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = ColorContainer.backgroundColor

        RecipeDetailComponentCell.register(in: tableView)
        RecipeDetailResultsInCell.register(in: tableView)
        RecipeExchangeDownloadCell.register(in: tableView)
    }

    func appendItemsToContent() {

        for ingredient in recipe.ingredientsInRecipe {
            tableContents.insert(
                RecipeExchangeDetailTableViewController.TableRowContent.component(
                    name: ingredient.name,
                    image: ingredient.image,
                    count: ingredient.amount,
                    id: ingredient.id),
                at: 0)
        }

        if let index = tableContents.firstIndex(of: RecipeExchangeDetailTableViewController.TableRowContent.downArrow) {
            for potion in recipe.potionsInRecipe {
                tableContents.insert(
                    RecipeExchangeDetailTableViewController.TableRowContent.component(
                        name: potion.name,
                        image: potion.image,
                        count: potion.amount,
                        id: potion.id),
                    at: index + 1)
            }
        }
    }
}
