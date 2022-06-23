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

    var sfSymbols = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        configDelegate()
        fetchSymbols()

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

    func fetchSymbols() {
        if let symbolURL = Bundle.main.url(forResource: "symbolList", withExtension: ".txt") {
            if let symbols = try? String(contentsOf: symbolURL) {
                sfSymbols = symbols.components(separatedBy: "\n")
            }
        }

        if sfSymbols.isEmpty {
            sfSymbols = ["Words not loaded"]
            let alertController = UIAlertController(
                title: "Error",
                message: "Symbols were not loaded",
                preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            present(alertController, animated: true)
        }

        print(sfSymbols)
    }
}
