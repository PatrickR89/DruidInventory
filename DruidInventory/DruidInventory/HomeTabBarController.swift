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

        configDelegate()

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addItem))

        let potionsTab = potionsTableController
        let recipesTab = recipesTableController

        let potionsBarItem = UITabBarItem(title: "Potions", image: UIImage(systemName: "testtube.2"), tag: 0)
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

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
           if viewController is PotionsTableViewController {
               let potionsTableViewController = PotionsTableViewController()
               tabBarController.present(potionsTableViewController, animated: true)
           }

           if viewController is RecipesTableViewController {
               let recipesTableViewController = RecipesTableViewController()
               tabBarController.present(recipesTableViewController, animated: true)
           }
       }
}

extension HomeTabBarController {
    @objc func addItem() {

    }
}
