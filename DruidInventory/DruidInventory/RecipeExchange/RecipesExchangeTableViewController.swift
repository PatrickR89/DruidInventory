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
    }
}
