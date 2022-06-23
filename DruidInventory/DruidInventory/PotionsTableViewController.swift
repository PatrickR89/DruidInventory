//
//  ViewController.swift
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

        potions.append(Potion(name: "Fast walk", image: "figure.walk", amount: 3))
    }
}

extension PotionsTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        potions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Potion", for: indexPath) as? PotionCell else {fatalError("Error loading cell")}
        cell.setupCell(with: potions[indexPath.row])
        return cell
    }

    func setupTableView() {

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PotionCell.self, forCellReuseIdentifier: "Potion")

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])

    }
}
