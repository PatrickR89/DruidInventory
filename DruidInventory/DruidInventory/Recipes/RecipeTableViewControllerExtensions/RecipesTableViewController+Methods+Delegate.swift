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
            guard let index = PotionContainer.shared.potions.firstIndex(where: {$0.id == ingredient.id}) else {return}
            let potion = PotionContainer.shared.potions[index]

            if potion.amount < ingredient.amount {
                tableView.reloadData()
            }
        }
    }
}

extension RecipesTableViewController: RecipesContainerDelegate {
    func deleteTableRow(indexPath: IndexPath) {
        tableView.deleteRows(at: [indexPath], with: .none)
    }

    func appendToTableView() {
        let section = tableView.numberOfSections - 1
        let row = tableView.numberOfRows(inSection: section)
        let indexPath = IndexPath(row: row, section: section)
        tableView.insertRows(at: [indexPath], with: .none)
    }

    func reloadTableViewRow(indexPath: IndexPath) {
        tableView.reloadRows(at: [indexPath], with: .none)
    }
}
