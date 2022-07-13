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

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        RecipesContainer.shared.recipes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = RecipeCell.dequeue(in: tableView, for: indexPath)
        cell.setupCell(recipe: RecipesContainer.shared.recipes[indexPath.row])
        cell.validateRecipe(ingredients: RecipesContainer.shared.recipes[indexPath.row].ingredientsInRecipe)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipeDetailView = RecipeDetailViewController(
            recipe: RecipesContainer.shared.recipes[indexPath.row],
            recipeIndexPath: indexPath)

        self.present(recipeDetailView, animated: true)

    }

    override func tableView(
        _ tableView: UITableView,
        leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            RecipesContainer.shared.deleteRecipe(indexPath: indexPath)

            return nil
        }

    override func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let recipe = RecipesContainer.shared.recipes[indexPath.row]
            let ingredients = recipe.ingredientsInRecipe
            if RecipesContainer.shared.checkIngredients(ingredients: ingredients) {
                RecipesContainer.shared.createPotion(recipe: recipe, recipeIndexPath: indexPath)

            }
            reloadTableViewOnIngredients(ingredients: ingredients)
            return nil
        }

    func configTableViewLayout() {
        tableView.delegate = self
        tableView.dataSource = self
        RecipeCell.register(in: tableView)
    }

    func reloadTableViewOnIngredients(ingredients: [Potion]) {
        for ingredient in ingredients {
            guard let index = PotionContainer.shared.potions.firstIndex(where: {$0.id == ingredient.id}) else {return}
            let potion = PotionContainer.shared.potions[index]

            if potion.amount < ingredient.amount {
                tableView.reloadData()
            }
        }
    }
}

extension RecipesTableViewController: RecipesContainerDelegate {
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
