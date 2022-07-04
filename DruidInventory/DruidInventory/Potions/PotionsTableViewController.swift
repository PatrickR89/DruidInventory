//
//  PotionsTableViewController.swift
//  DruidInventory
//
//  Created by Patrick on 23.06.2022..
//

import UIKit

class PotionsTableViewController: UITableViewController {

    var potions = [Potion]()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        potions = [
            Potion(name: "Fast walk", image: "figure.walk", amount: 3),
            Potion(name: "Shapeshift", image: "pawprint.fill", amount: 0)]
    }
}

extension PotionsTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        potions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = PotionCell.dequeue(in: tableView, for: indexPath)
        cell.setupCell(with: potions[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let potionDetailView = PotionDetailViewController(potion: potions[indexPath.row], indexPath: indexPath)

        self.present(potionDetailView, animated: true)
    }

    override func tableView(
        _ tableView: UITableView,
        leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        potions[indexPath.row].amount -= 1
        tableView.reloadRows(at: [indexPath], with: .none)
        return nil
    }

    override func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        potions[indexPath.row].amount += 1
        tableView.reloadRows(at: [indexPath], with: .none)
        return nil
    }
}

extension PotionsTableViewController {

    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        PotionCell.register(in: tableView)
    }
}
