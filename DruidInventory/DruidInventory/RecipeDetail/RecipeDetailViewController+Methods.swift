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

    func appendItemsToView() {

        for ingredient in recipe.ingredientsInRecipe {
            tableContents.insert(RecipeDetailViewController.TableRowContent.component(ingredient: ingredient, count: ingredient.amount), at: 0)
        }
//        if recipe.ingredientsInRecipe.count < 4 {
//            viewOrder.append(RecipeDetailLayout(amount: "", image: "plus", name: "addIngredient"))
//        }
//
//        viewOrder.append(RecipeDetailLayout(amount: "", image: "arrow.down", name: "resultsIn"))
//        for potion in recipe.potionsInRecipe {
//            viewOrder.append(RecipeDetailLayout(
//                amount: "\(potion.amount)x",
//                image: potion.image,
//                name: potion.name))
//        }
//
//        if recipe.potionsInRecipe.count < 2 {
//            viewOrder.append(RecipeDetailLayout(amount: "", image: "plus", name: "addPotion"))
//        }
    }
//
//    func configMakeButtonLayout() {
//        view.addSubview(makeButton)
//        makeButton.translatesAutoresizingMaskIntoConstraints = false
//        makeButton.setTitle("MAKE", for: .normal)
//        makeButton.backgroundColor = .systemBlue
//        let numOfCells = viewOrder.count + 1
//
//        NSLayoutConstraint.activate([
//            makeButton.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
//            makeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(50 * numOfCells))
//        ])
//
//    }
}
