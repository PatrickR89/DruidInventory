//
//  RecipeDetailViewController+TV_Delegate_DataSource.swift
//  DruidInventory
//
//  Created by Patrick on 07.07.2022..
//

import UIKit

extension RecipeDetailViewController {

    // MARK: tableView DataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableContents.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let content = tableContents[indexPath.row]

        switch content {
        case .plusButton(let type):
            let cell = RecipeDetailPlusCell.dequeue(in: tableView, for: indexPath)
            cell.setupCell(typeOfComponent: type)
            return cell

        case .downArrow:
            let cell = RecipeDetailResultsInCell.dequeue(in: tableView, for: indexPath)

            cell.setupCell()
            return cell

        case .makeButton:
            let cell = RecipeDetailMakeButtonCell.dequeue(in: tableView, for: indexPath)
            cell.setupCell(
                isNewRecipe: isNewRecipe,
                isRecipeValid: isRecipeValid,
                enoughIngredients: RecipesContainer.shared.checkIngredients(ingredients: recipe.ingredientsInRecipe))
            return cell

        case .component(let name, let image, let count, _):
            let cell = RecipeDetailComponentCell.dequeue(in: tableView, for: indexPath)

            cell.setupCell(name: name, image: image, count: count)
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
        case .plusButton(let type):
            let tempComponent = Potion(name: "", image: "", amount: 0, id: UUID())

            recipeComponentManipulation(
                type: type,
                recipe: recipe,
                component: tempComponent,
                componentIndexPath: indexPath)

        case .downArrow:
            return
        case .makeButton:
            if isNewRecipe && isRecipeValid {
                RecipesContainer.shared.addRecipe(recipe: recipe)
                self.dismiss(animated: true)
            } else if !isNewRecipe && isRecipeValid && RecipesContainer.shared.checkIngredients(
                ingredients: recipe.ingredientsInRecipe) {
                RecipesContainer.shared.createPotion(recipe: recipe)
                self.dismiss(animated: true)
            }

        case .component(let name, let image, let count, let id):

            if let index = tableContents.firstIndex(of: RecipeDetailViewController.TableRowContent.downArrow) {
                let type: RecipeComponentType
                if indexPath.row < index {
                    type = RecipeComponentType.inputChange
                } else {
                    type = RecipeComponentType.outputChange
                }

                let tempComponent = Potion(name: name, image: image, amount: count, id: id)
                RecipesContainer.shared.filterComponents(recipe: recipe)

                recipeComponentManipulation(
                    type: type,
                    recipe: recipe,
                    component: tempComponent,
                    componentIndexPath: indexPath)
            }
        }
    }

    override func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

            let content = tableContents[indexPath.row]

            switch content {
            case .component(let name, let image, let count, let id):

                guard let index = tableContents.firstIndex(
                    of: RecipeDetailViewController.TableRowContent.downArrow) else {return nil}
                let type: RecipeComponentType
                if indexPath.row < index {
                    type = RecipeComponentType.inputChange
                } else {
                    type = RecipeComponentType.outputChange
                }

                let tempComponent = Potion(name: name, image: image, amount: count, id: id)

                let removeIngredient = UIContextualAction(
                    style: .normal,
                    title: "REMOVE") {_, _, completitionHandler in
                        self.removeComponent(
                            type: type,
                            component: tempComponent,
                            componentIndexPath: indexPath)
                        completitionHandler(true)
                    }
                removeIngredient.backgroundColor = UIColor(named: "swipeTrailingThree")

                let swipeConfig = UISwipeActionsConfiguration(actions: [removeIngredient])

                swipeConfig.performsFirstActionWithFullSwipe = false

                return swipeConfig

            default:
                return nil
            }
        }
}
