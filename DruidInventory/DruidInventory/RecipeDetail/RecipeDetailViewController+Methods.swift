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
        tableView.register(RecipeDetailCell.self, forCellReuseIdentifier: "detailRecipe")
    }

    func appendItemsToView() {

        for ingredient in recipe.ingredientsInRecipe {
            viewOrder.append(
                RecipeDetailLayout(
                    amount: "\(ingredient.amount)x",
                    image: ingredient.image,
                    name: ingredient.name))
        }
        if recipe.ingredientsInRecipe.count < 4 {
            viewOrder.append(RecipeDetailLayout(amount: "", image: "plus", name: "addIngredient"))
        }

        viewOrder.append(RecipeDetailLayout(amount: "", image: "arrow.down", name: "resultsIn"))
        for potion in recipe.potionsInRecipe {
            viewOrder.append(RecipeDetailLayout(
                amount: "\(potion.amount)x",
                image: potion.image,
                name: potion.name))
        }

        if recipe.potionsInRecipe.count < 2 {
            viewOrder.append(RecipeDetailLayout(amount: "", image: "plus", name: "addPotion"))
        }
    }

    func configMakeButtonLayout() {
        view.addSubview(makeButton)
        makeButton.translatesAutoresizingMaskIntoConstraints = false
        makeButton.setTitle("MAKE", for: .normal)
        makeButton.backgroundColor = .systemBlue
        let numOfCells = viewOrder.count + 1

        NSLayoutConstraint.activate([
            makeButton.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            makeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(50 * numOfCells))
        ])

    }
}
