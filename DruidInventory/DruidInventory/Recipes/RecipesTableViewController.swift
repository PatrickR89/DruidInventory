//
//  RecipesTableViewController.swift
//  DruidInventory
//
//  Created by Patrick on 23.06.2022..
//

import UIKit

class RecipesTableViewController: UITableViewController {

    var recipeOrder = [UUID]()

    override func viewWillAppear(_ animated: Bool) {
        RecipesContainer.shared.delegate = self
        recipeOrder = []
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configTableViewLayout()
        view.backgroundColor = ColorContainer.backgroundColor
    }
}

extension RecipesTableViewController: HomeTabBarNavActionProvider {
    func exchangeRecipes() {
        let recipeExchangeView = RecipeExchangeTableViewController()
        let navController = UINavigationController()
        navController.viewControllers = [recipeExchangeView]
        present(navController, animated: true)
    }

    func addNew() {
        let recipe = Recipe(id: UUID(), ingredientsInRecipe: [], potionsInRecipe: [])
        let recipeDetailViewController = RecipeDetailViewController(recipe: recipe)
        recipeDetailViewController.isNewRecipe = true
        let navController = UINavigationController()
        navController.viewControllers = [recipeDetailViewController]
        present(navController, animated: true)
    }
}
