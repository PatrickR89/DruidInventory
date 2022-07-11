//
//  PotionsTableViewController.swift
//  DruidInventory
//
//  Created by Patrick on 23.06.2022..
//

import UIKit

class PotionsTableViewController: UITableViewController {

    override func viewWillAppear(_ animated: Bool) {
        PotionContainer.shared.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        setupTableView()
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
