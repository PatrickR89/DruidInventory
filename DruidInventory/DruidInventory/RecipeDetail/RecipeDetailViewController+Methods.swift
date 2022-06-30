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
            tableContents.insert(RecipeDetailViewController.TableRowContent.component(component: ingredient, count: ingredient.amount), at: 0)
        }

//        viewOrder.append(RecipeDetailLayout(amount: "", image: "arrow.down", name: "resultsIn"))
//        for potion in recipe.potionsInRecipe {
//            viewOrder.append(RecipeDetailLayout(
//                amount: "\(potion.amount)x",
//                image: potion.image,
//                name: potion.name))
//        }

    }
}
