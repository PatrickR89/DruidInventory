//
//  PotionsTableViewController+Delegates.swift
//  DruidInventory
//
//  Created by Patrick on 07.07.2022..
//

import UIKit

extension PotionsTableViewController: PotionDelegate {
    func reloadTableViewRow(indexPath: IndexPath) {
        tableView.reloadRows(at: [indexPath], with: .none)
    }

    func appendToTableView() {
        let section = tableView.numberOfSections - 1
        let row = tableView.numberOfRows(inSection: section)
        let indexPath = IndexPath(row: row, section: section)
        tableView.insertRows(at: [indexPath], with: .none)
    }
}

extension PotionsTableViewController: HomeTabBarNavActionProvider {
    func addNew() {
        let potion = Potion(name: "", image: "", amount: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        let potionDetailViewController = PotionDetailViewController(potion: potion, indexPath: indexPath)
        potionDetailViewController.newPotion = true
        present(potionDetailViewController, animated: true)
    }
}
