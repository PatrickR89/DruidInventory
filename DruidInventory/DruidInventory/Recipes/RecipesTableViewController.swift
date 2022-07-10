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
        RecipesSingleton.shared.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configTableViewLayout()
        view.backgroundColor = .white
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        RecipesSingleton.shared.recipes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = RecipeCell.dequeue(in: tableView, for: indexPath)
        cell.setupCell(recipe: RecipesSingleton.shared.recipes[indexPath.row])
        cell.validateRecipe(ingredients: RecipesSingleton.shared.recipes[indexPath.row].ingredientsInRecipe)

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipeDetailView = RecipeDetailViewController(
            recipe: RecipesSingleton.shared.recipes[indexPath.row],
            recipeIndexPath: indexPath)

        self.present(recipeDetailView, animated: true)

    }

    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        RecipesSingleton.shared.deleteRecipe(indexPath: indexPath)

        return nil
    }

    func configTableViewLayout() {
        tableView.delegate = self
        tableView.dataSource = self
        RecipeCell.register(in: tableView)
    }
}

extension RecipesTableViewController: RecipesDelegate {
    func deleteTableRow(indexPath: IndexPath) {
        tableView.deleteRows(at: [indexPath], with: .none)
    }

    func appendToTableView() {
        let section = tableView.numberOfSections - 1
        let row = tableView.numberOfRows(inSection: section)
        let indexPath = IndexPath(row: row, section: section)
        tableView.insertRows(at: [indexPath], with: .none)
    }

    func reloadTableViewRow(indexPath: IndexPath) {
        tableView.reloadRows(at: [indexPath], with: .none)
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
