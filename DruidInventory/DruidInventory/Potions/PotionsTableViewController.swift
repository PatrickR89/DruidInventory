//
//  PotionsTableViewController.swift
//  DruidInventory
//
//  Created by Patrick on 23.06.2022..
//

import UIKit

class PotionsTableViewController: UITableViewController {

    override func viewWillAppear(_ animated: Bool) {
        PotionSingleton.shared.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
}

extension PotionsTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        PotionSingleton.shared.potions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = PotionCell.dequeue(in: tableView, for: indexPath)
        cell.setupCell(with: PotionSingleton.shared.potions[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let potionDetailView = PotionDetailViewController(
            potion: PotionSingleton.shared.potions[indexPath.row],
            indexPath: indexPath)

        self.present(potionDetailView, animated: true)
    }

    override func tableView(
        _ tableView: UITableView,
        leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            PotionSingleton.shared.potions[indexPath.row].amount -= 1
        tableView.reloadRows(at: [indexPath], with: .none)
        return nil
    }

    override func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            PotionSingleton.shared.potions[indexPath.row].amount += 1
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

extension PotionsTableViewController: PotionDelegate {
    func reloadTableViewRow(indexPath: IndexPath) {
        tableView.reloadRows(at: [indexPath], with: .none)
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
