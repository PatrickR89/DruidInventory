//
//  RecipesExchangeTableViewController+Extensions.swift
//  DruidInventory
//
//  Created by Patrick on 22.07.2022..
//

import UIKit

extension RecipesExchangeTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        OnlineRecipesContainer.shared.getAllOnlineRecipes().count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = RecipeCell.dequeue(in: tableView, for: indexPath)
        let recipes = OnlineRecipesContainer.shared.getAllOnlineRecipes()
        cell.setupCell(recipe: recipes[indexPath.row])
        cell.validateRecipe(ingredients: recipes[indexPath.row].ingredientsInRecipe)
        onlineRecipesOrder.append(recipes[indexPath.row].id)
        return cell
    }

//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let recipe = RecipesContainer.shared.findRecipe(id: onlineRecipesOrder[indexPath.row]) else {return}
//        let recipeDetailView = RecipeDetailViewController(
//            recipe: recipe)
//        let navController = UINavigationController()
//        navController.viewControllers = [recipeDetailView]
//
//        self.present(navController, animated: true)
//
//    }

    override func tableView(
        _ tableView: UITableView,
        leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

            guard let recipe = OnlineRecipesContainer.shared.findRecipe(
                id: onlineRecipesOrder[indexPath.row]) else {return nil}
            let ingredients = recipe.ingredientsInRecipe
            if RecipesContainer.shared.checkIngredients(ingredients: ingredients) {
                let downloadRecipe = UIContextualAction(
                    style: .normal,
                    title: "DOWNLOAD") {_, _, completitionHandler in

                        completitionHandler(true)
                    }
                downloadRecipe.image = UIImage(systemName: "arrow.up.arrow.down")
                downloadRecipe.backgroundColor = ColorContainer.lightGreenSwipe
                let swipeConfig = UISwipeActionsConfiguration(actions: [downloadRecipe])

                swipeConfig.performsFirstActionWithFullSwipe = false

                return swipeConfig
            } else {
                return nil
            }

        }

    func configTableViewLayout() {
        tableView.delegate = self
        tableView.dataSource = self
        RecipeCell.register(in: tableView)
    }
}
