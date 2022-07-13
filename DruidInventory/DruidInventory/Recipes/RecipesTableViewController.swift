//
//  RecipesTableViewController.swift
//  DruidInventory
//
//  Created by Patrick on 23.06.2022..
//

import UIKit

class RecipesTableViewController: UITableViewController {

    var ingredients = [Potion]()

    override func viewWillAppear(_ animated: Bool) {
        RecipesContainer.shared.delegate = self
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configTableViewLayout()
        view.backgroundColor = .white
    }
}

extension RecipesTableViewController: HomeTabBarNavActionProvider {
    func addNew() {
        let recipe = Recipe(ingredientsInRecipe: [], potionsInRecipe: [])
        let indexPath = IndexPath(row: 0, section: 0)
        let recipeDetailViewController = RecipeDetailViewController(recipe: recipe, recipeIndexPath: indexPath)
        recipeDetailViewController.isNewRecipe = true
        present(recipeDetailViewController, animated: true)
    }
}
