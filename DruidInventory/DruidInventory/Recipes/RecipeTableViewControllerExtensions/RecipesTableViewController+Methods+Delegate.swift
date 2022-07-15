//
//  RecipesTableViewController+Methods+Delegate.swift
//  DruidInventory
//
//  Created by Patrick on 13.07.2022..
//

import UIKit

extension RecipesTableViewController {

    func configTableViewLayout() {
        tableView.delegate = self
        tableView.dataSource = self
        RecipeCell.register(in: tableView)
    }

    func reloadTableViewOnIngredients(ingredients: [Potion]) {
        for ingredient in ingredients {

            guard let potion = PotionContainer.shared.findPotion(id: ingredient.id) else {return}

            if potion.amount < ingredient.amount {
                tableView.reloadData()
            }
        }
    }
}

extension RecipesTableViewController: RecipesContainerDelegate {
    func editedRecipe(id: UUID) {
        guard let row = recipeOrder.firstIndex(where: {$0 == id}) else {return}
        let section = tableView.numberOfSections - 1
        let indexPath = IndexPath(row: row, section: section)
        tableView.reloadRows(at: [indexPath], with: .none)
    }

    func createdPotion(ingredients: [Potion]) {
        reloadTableViewOnIngredients(ingredients: ingredients)
    }

    func deletedRecipe(id: UUID) {
        guard let row = recipeOrder.firstIndex(where: {$0 == id}) else {return}
        let section = tableView.numberOfSections - 1
        let indexPath = IndexPath(row: row, section: section)
        tableView.deleteRows(at: [indexPath], with: .none)
    }

    func addedNewRecipe() {
        let section = tableView.numberOfSections - 1
        let row = tableView.numberOfRows(inSection: section)
        let indexPath = IndexPath(row: row, section: section)
        tableView.insertRows(at: [indexPath], with: .none)
    }
}
