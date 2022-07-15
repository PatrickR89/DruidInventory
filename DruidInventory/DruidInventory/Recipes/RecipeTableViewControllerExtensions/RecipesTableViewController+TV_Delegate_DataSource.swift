//
//  RecipesTableViewController+TV_Delegate_DataSource.swift
//  DruidInventory
//
//  Created by Patrick on 13.07.2022..
//

import UIKit

extension RecipesTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        RecipesContainer.shared.recipes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = RecipeCell.dequeue(in: tableView, for: indexPath)
        cell.setupCell(recipe: RecipesContainer.shared.recipes[indexPath.row])
        cell.validateRecipe(ingredients: RecipesContainer.shared.recipes[indexPath.row].ingredientsInRecipe)
        recipeOrder.append(RecipesContainer.shared.recipes[indexPath.row].id)
        print(recipeOrder)
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
                RecipesContainer.shared.createPotion(recipe: recipe)

            }
            reloadTableViewOnIngredients(ingredients: ingredients)
            return nil
        }
}
