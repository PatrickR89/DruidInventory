//
//  PotionsTableViewController+TV_Delegate_DataSource.swift
//  DruidInventory
//
//  Created by Patrick on 07.07.2022..
//

import UIKit

extension PotionsTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let potions = PotionContainer.shared.getAllPotions()
        return potions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = PotionCell.dequeue(in: tableView, for: indexPath)
        let potions = PotionContainer.shared.getAllPotions()
        cell.setupCell(with: potions[indexPath.row])
        potionsOrder.append(potions[indexPath.row].id)

        return cell
    }
}

extension PotionsTableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = potionsOrder[indexPath.row]
        guard let potion = PotionContainer.shared.findPotion(id: id) else {return}
        let potionDetailView = PotionDetailViewController(
            potion: potion)

        self.present(potionDetailView, animated: true)
    }

    override func tableView(
        _ tableView: UITableView,
        leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let id = potionsOrder[indexPath.row]
            PotionContainer.shared.updatePotionAmount(id: id, amount: -1)
            return nil
        }

    override func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let id = potionsOrder[indexPath.row]
            PotionContainer.shared.updatePotionAmount(id: id, amount: 1)

            return nil
        }
}
