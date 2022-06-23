//
//  HomeTabBarController.swift
//  DruidInventory
//
//  Created by Patrick on 23.06.2022..
//

import UIKit

class HomeTabBarController: UITabBarController {

    let potionsTableController = PotionsTableViewController()
    let recipesTableController = RecipesTableViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red

        configDelegate()

        let potionsTab = potionsTableController
        let recipesTab = recipesTableController

        let potionsBarItem = UITabBarItem(title: "Potions", image: UIImage(systemName: "drop.circle"), tag: 0)
        let recipesBarItem = UITabBarItem(title: "Recipes", image: UIImage(systemName: "book"), tag: 1)

        potionsTab.tabBarItem = potionsBarItem
        recipesTab.tabBarItem = recipesBarItem

        self.setViewControllers([potionsTab, recipesTab], animated: true)
    }
}

extension HomeTabBarController: UITabBarControllerDelegate {
    func configDelegate() {
        self.delegate = self
    }
}
