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
            let tempIngredient = UnknownPotionsFilter.shared.identifyPotion(potion: ingredient)
            tableContents.insert(
                RecipeExchangeDetailTableViewController.TableRowContent.component(
                    name: tempIngredient.name,
                    image: tempIngredient.image,
                    count: tempIngredient.amount,
                    id: tempIngredient.id),
                at: 0)
        }

        if let index = tableContents.firstIndex(of: RecipeExchangeDetailTableViewController.TableRowContent.downArrow) {
            for potion in recipe.potionsInRecipe {
                let tempPotion = UnknownPotionsFilter.shared.identifyPotion(potion: potion)

                tableContents.insert(
                    RecipeExchangeDetailTableViewController.TableRowContent.component(
                        name: tempPotion.name,
                        image: tempPotion.image,
                        count: tempPotion.amount,
                        id: tempPotion.id),
                    at: index + 1)
            }
        }
    }
}
