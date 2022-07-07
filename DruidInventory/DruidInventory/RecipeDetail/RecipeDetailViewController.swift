//
//  RecipeDetailViewController.swift
//  DruidInventory
//
//  Created by Patrick on 28.06.2022..
//

import UIKit

class RecipeDetailViewController: UITableViewController {

    var recipe: Recipe
    var recipeIndexPath: IndexPath

    enum TableRowContent {

        case plusButton(type: RecipeComponentType)
        case downArrow
        case makeButton
        case component(name: String, image: String, count: Int)
    }

    var tableContents: [TableRowContent] = [.downArrow, .makeButton]

    required init(recipe: Recipe, recipeIndexPath: IndexPath) {
        self.recipe = recipe
        self.recipeIndexPath = recipeIndexPath

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        appendPlusButtons()
        configTableViewLayout()
        appendItemsToContent()
    }
}

extension RecipeDetailViewController {

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

            return cell

        case .component(let name, let image, let count):
            let cell = RecipeDetailComponentCell.dequeue(in: tableView, for: indexPath)

            cell.setupCell(name: name, image: image, count: count)
            return cell
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let content = tableContents[indexPath.row]

        switch content {
        case .plusButton(let type):
            print("add \(type) at \(indexPath)")
            addNewItem(type: type, recipe: recipe, ingredientIndexPath: indexPath)
        case .downArrow:
            print("down arrow \(indexPath)")
        case .makeButton:
            print("make button \(indexPath)")
        case .component(let name):
            print("component \(name) at \(indexPath)")
        }
    }

}

extension RecipeDetailViewController.TableRowContent: Equatable {
}

extension RecipeDetailViewController {
    func appendPlusButtons() {
        if recipe.ingredientsInRecipe.count < 4 {
            tableContents.insert(.plusButton(type: .inputNew), at: 0)
        }

        if recipe.potionsInRecipe.count < 2 {
            if let index = tableContents.firstIndex(of: RecipeDetailViewController.TableRowContent.downArrow) {
                tableContents.insert(.plusButton(type: .outputNew), at: index + 1)
            }
        }
    }

    func addNewItem(type: RecipeComponentType, recipe: Recipe, ingredientIndexPath: IndexPath) {
        switch type {
        case .inputNew:
            let recipeComponentSelector = RecipeComponentSelectorController(ingredientIndexPath: ingredientIndexPath)
            recipeComponentSelector.delegate = self
            present(recipeComponentSelector, animated: true)
        case .outputNew:
            print("output items")
        default:
            print("no other type")
        }
    }

}

extension RecipeDetailViewController: RecipeComponentSelectorDelegate {
    func appendNewIngredient(name: String, image: String, amount: Int, ingredientIndexPath: IndexPath) {
        let newIngredient = Potion(name: name, image: image, amount: amount)
        recipe.ingredientsInRecipe.append(newIngredient)
        tableContents.insert( RecipeDetailViewController.TableRowContent.component(
            name: newIngredient.name,
            image: newIngredient.image,
            count: newIngredient.amount), at: ingredientIndexPath.row)
        tableView.insertRows(at: [ingredientIndexPath], with: .none)

        if recipe.ingredientsInRecipe.count >= 4 {
            let tempIndexPath = IndexPath(row: ingredientIndexPath.row + 1, section: ingredientIndexPath.section)
            tableContents.remove(at: tempIndexPath.row)
            tableView.deleteRows(at: [tempIndexPath], with: .none)
        }
    }
}
