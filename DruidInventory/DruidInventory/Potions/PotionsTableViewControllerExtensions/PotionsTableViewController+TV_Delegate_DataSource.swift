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

            let addOneAction = UIContextualAction(
                style: .normal,
                title: "+1") {_, _, completitionHandler in
                    PotionContainer.shared.updatePotionAmount(id: id, amount: 1)
                    completitionHandler(true)
                }

            let addTwoAction = UIContextualAction(
                style: .normal,
                title: "+2") {_, _, completitionHandler in
                    PotionContainer.shared.updatePotionAmount(id: id, amount: 2)
                    completitionHandler(true)
                }

            let addFiveAction = UIContextualAction(
                style: .normal,
                title: "+5") {_, _, completitionHandler in
                    PotionContainer.shared.updatePotionAmount(id: id, amount: 5)
                    completitionHandler(true)
                }

            let swipeConfig = UISwipeActionsConfiguration(actions: [addOneAction, addTwoAction, addFiveAction])

            swipeConfig.performsFirstActionWithFullSwipe = false

            return swipeConfig
        }

    override func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let id = potionsOrder[indexPath.row]

            let reduceOneAction = UIContextualAction(
                style: .normal,
                title: "-1") {_, _, completitionHandler in
                    PotionContainer.shared.updatePotionAmount(id: id, amount: -1)
                    completitionHandler(true)
                }

            let reduceTwoAction = UIContextualAction(
                style: .normal,
                title: "-2") {_, _, completitionHandler in
                    PotionContainer.shared.updatePotionAmount(id: id, amount: -2)
                    completitionHandler(true)
                }

            let reduceFiveAction = UIContextualAction(
                style: .normal,
                title: "-5") {_, _, completitionHandler in
                    PotionContainer.shared.updatePotionAmount(id: id, amount: -5)
                    completitionHandler(true)
                }

            let swipeConfig = UISwipeActionsConfiguration(actions: [reduceOneAction, reduceTwoAction, reduceFiveAction])

            swipeConfig.performsFirstActionWithFullSwipe = false

            return swipeConfig
        }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
