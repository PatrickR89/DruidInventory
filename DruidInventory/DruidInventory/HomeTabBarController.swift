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

    var potionSymbolNames = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        configDelegate()
        fetchSymbols()

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addItem))

        let potionsBarItem = UITabBarItem(title: "Potions", image: UIImage(systemName: "testtube.2"), tag: 0)
        let recipesBarItem = UITabBarItem(title: "Recipes", image: UIImage(systemName: "book"), tag: 1)

        potionsTableController.tabBarItem = potionsBarItem
        recipesTableController.tabBarItem = recipesBarItem

        self.setViewControllers([potionsTableController, recipesTableController], animated: true)
    }
}

extension HomeTabBarController: UITabBarControllerDelegate {
    func configDelegate() {
        self.delegate = self
    }
}

extension HomeTabBarController {
    @objc func addItem() {

    }

    func fetchSymbols() {
        if let symbolURL = Bundle.main.url(forResource: "symbolList", withExtension: ".txt") {
            if let symbols = try? String(contentsOf: symbolURL) {
                potionSymbolNames = symbols.components(separatedBy: "\n")
            }
        }

        if potionSymbolNames.isEmpty {
            potionSymbolNames = ["xmark.octagon"]
            let alertController = UIAlertController(
                title: "Error",
                message: "Symbols were not loaded",
                preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            present(alertController, animated: true)
        }
    }
}
