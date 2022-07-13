//
//  PotionsTableViewController+TV_Delegate_DataSource.swift
//  DruidInventory
//
//  Created by Patrick on 07.07.2022..
//

import UIKit

extension PotionsTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        PotionContainer.shared.potions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = PotionCell.dequeue(in: tableView, for: indexPath)
        cell.setupCell(with: PotionContainer.shared.potions[indexPath.row])
        potionsOrder[PotionContainer.shared.potions[indexPath.row].id] = indexPath

        return cell
    }
}

extension PotionsTableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let potionDetailView = PotionDetailViewController(
            potion: PotionContainer.shared.potions[indexPath.row],
            indexPath: indexPath)

        self.present(potionDetailView, animated: true)
    }

    override func tableView(
        _ tableView: UITableView,
        leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            PotionContainer.shared.reduceFromPotionAmount(indexPath: indexPath)
            return nil
        }

    override func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            PotionContainer.shared.addToPotionAmount(indexPath: indexPath)
            return nil
        }
}
