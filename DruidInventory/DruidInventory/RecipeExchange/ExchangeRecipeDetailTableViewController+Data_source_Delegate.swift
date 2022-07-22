//
//  ExchangeRecipeDetailTableViewController+Extensions.swift
//  DruidInventory
//
//  Created by Patrick on 22.07.2022..
//

import UIKit

extension ExchangeRecipeDetailTableViewController {
    // MARK: tableView DataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableContents.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let content = tableContents[indexPath.row]

        switch content {

        case .downArrow:
            let cell = RecipeDetailResultsInCell.dequeue(in: tableView, for: indexPath)

            cell.setupCell()
            return cell

        case .downloadBtn:
            let cell = ExchangeRecipesDownloadCell.dequeue(in: tableView, for: indexPath)
            let validRecipe = !OnlineRecipesContainer.shared.validateRecipe(
                recipe: recipe,
                validationRecipes: RecipesContainer.shared.getAllRecipes())
            cell.setupCell(isRecipeValid: validRecipe)
            return cell

        case .component(_, let image, let count, let id):
            let cell = RecipeDetailComponentCell.dequeue(in: tableView, for: indexPath)

            guard let index = tableContents.firstIndex(
                of: ExchangeRecipeDetailTableViewController.TableRowContent.downArrow) else {return cell}
            let type: RecipeComponentType
            if indexPath.row < index {
                type = RecipeComponentType.inputChange
            } else {
                type = RecipeComponentType.outputChange
            }

            cell.setupCell(id: id, image: image, count: count, type: type)
            return cell
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    // MARK: tableView Delegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let content = tableContents[indexPath.row]

        switch content {
        case .downArrow:
            return
        case .downloadBtn:
            if !OnlineRecipesContainer.shared.validateRecipe(
                recipe: recipe,
                validationRecipes: RecipesContainer.shared.getAllRecipes()) {
                OnlineRecipesContainer.shared.downloadRecipe(recipe: recipe)
                self.dismiss(animated: true)
            }

        case .component(let name, let image, let count, let id):
            let potion = Potion(name: name, image: image, amount: count, id: id)
            let componentView = RecipeComponentSelectorViewController(
                componentIndexPath: indexPath,
                type: .inputChange,
                potion: potion,
                filteredComponents: [],
                isLocal: false)
            let navController = UINavigationController()
            navController.viewControllers = [componentView]
            present(navController, animated: true)
        }
    }
}
