//
//  RecipesExchangeTableViewController.swift
//  DruidInventory
//
//  Created by Patrick on 22.07.2022..
//

import UIKit

class RecipesExchangeTableViewController: UITableViewController {

    var onlineRecipesOrder = [UUID]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configTableViewLayout()
        view.backgroundColor = ColorContainer.backgroundColor

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "DONE",
            style: .done,
            target: self,
            action: #selector(dismissOnTap))
    }

    @objc func dismissOnTap() {
        self.dismiss(animated: true)
    }

}
