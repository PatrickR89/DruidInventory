//
//  RecipesTableViewController+TV_Delegate_DataSource.swift
//  DruidInventory
//
//  Created by Patrick on 13.07.2022..
//

import UIKit

extension RecipesTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        RecipesContainer.shared.getAllRecipes().count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = RecipeCell.dequeue(in: tableView, for: indexPath)
        let recipes = RecipesContainer.shared.getAllRecipes()
        cell.setupCell(recipe: recipes[indexPath.row])
        cell.validateRecipe(ingredients: recipes[indexPath.row].ingredientsInRecipe)
        recipeOrder.append(recipes[indexPath.row].id)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let recipe = RecipesContainer.shared.findRecipe(id: recipeOrder[indexPath.row]) else {return}
        let recipeDetailView = RecipeDetailViewController(
            recipe: recipe)

        self.present(recipeDetailView, animated: true)

    }

    override func tableView(
        _ tableView: UITableView,
        leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

            guard let recipe = RecipesContainer.shared.findRecipe(id: recipeOrder[indexPath.row]) else {return nil}
            let ingredients = recipe.ingredientsInRecipe

            let makePotion = UIContextualAction(
                style: .normal,
                title: "MAKE") {_, _, completitionHandler in
                    if RecipesContainer.shared.checkIngredients(ingredients: ingredients) {
                        RecipesContainer.shared.createPotion(recipe: recipe)
                    }
                    completitionHandler(true)
                }

            let swipeConfig = UISwipeActionsConfiguration(actions: [makePotion])

            swipeConfig.performsFirstActionWithFullSwipe = false

            return swipeConfig
        }

    override func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let id = recipeOrder[indexPath.row]

            let deleteRecipe = UIContextualAction(
                style: .normal,
                title: "DELETE") {_, _, completitionHandler in
                    RecipesContainer.shared.deleteRecipe(id: id)
                    completitionHandler(true)
                }

            let swipeConfig = UISwipeActionsConfiguration(actions: [deleteRecipe])

            swipeConfig.performsFirstActionWithFullSwipe = false

            return swipeConfig
        }
}
