//
//  PotionsTableViewController+Delegates.swift
//  DruidInventory
//
//  Created by Patrick on 07.07.2022..
//

import UIKit

extension PotionsTableViewController: PotionContainerDelegate {

    func editedPotion(id: UUID) {
//        guard let indexPath = PotionContainer.shared.potionsOrder[id] else {return}
        let section = tableView.numberOfSections - 1
        guard let row = PotionContainer.shared.potions.firstIndex(where: {$0.id == id}) else {return}
        let indexPath = IndexPath(row: row, section: section)
        tableView.reloadRows(at: [indexPath], with: .none)
    }

    func addedNewPotion() {
        let section = tableView.numberOfSections - 1
        let row = tableView.numberOfRows(inSection: section)
        let indexPath = IndexPath(row: row, section: section)
        tableView.insertRows(at: [indexPath], with: .none)
    }
}

extension PotionsTableViewController: HomeTabBarNavActionProvider {
    func addNew() {
        let potion = Potion(name: "", image: "", amount: 0, id: UUID())
        let indexPath = IndexPath(row: 0, section: 0)
        let potionDetailViewController = PotionDetailViewController(potion: potion, indexPath: indexPath)
        potionDetailViewController.newPotion = true
        present(potionDetailViewController, animated: true)
    }
}
