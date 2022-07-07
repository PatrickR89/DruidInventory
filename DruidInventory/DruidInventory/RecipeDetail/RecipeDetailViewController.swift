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
            let tempComponent = Potion(name: "", image: "", amount: 0)
            recipeComponentManipulation(
                type: type,
                recipe: recipe,
                component: tempComponent,
                componentIndexPath: indexPath)
        case .downArrow:
            print("down arrow \(indexPath)")
        case .makeButton:
            print("make button \(indexPath)")
        case .component(let name, let image, let count):
            print("component \(name) at \(indexPath)")

            if let index = tableContents.firstIndex(of: RecipeDetailViewController.TableRowContent.downArrow) {
                let type: RecipeComponentType
                if indexPath.row < index {
                    type = RecipeComponentType.inputChange
                } else {
                    type = RecipeComponentType.outputChange
                }

                let tempComponent = Potion(name: name, image: image, amount: count)
                recipeComponentManipulation(
                    type: type,
                    recipe: recipe,
                    component: tempComponent,
                    componentIndexPath: indexPath)
            }

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

    func recipeComponentManipulation(
        type: RecipeComponentType,
        recipe: Recipe,
        component: Potion,
        componentIndexPath: IndexPath) {

        let recipeComponentSelector = RecipeComponentSelectorController(
            componentIndexPath: componentIndexPath,
            type: type, potion: component)
        recipeComponentSelector.delegate = self

        switch type {
        case .inputNew, .outputNew:
            print("componentManipulation")
        case .inputChange, .outputChange:
            recipeComponentSelector.setupRecipe(recipe: recipe, potion: component)
        }
        present(recipeComponentSelector, animated: true)
    }
}

extension RecipeDetailViewController: RecipeComponentSelectorDelegate {
    func editExistingComponent(
        component: Potion,
        componentType: RecipeComponentType,
        componentIndexPath: IndexPath,
        componentRecipeIndex: Int) {
        switch componentType {
        case .inputNew, .outputNew:
            return
        case .inputChange:
            recipe.ingredientsInRecipe[componentRecipeIndex] = component
        case .outputChange:
            recipe.potionsInRecipe[componentRecipeIndex] = component
        }
        tableContents[componentIndexPath.row] = RecipeDetailViewController.TableRowContent.component(
            name: component.name,
            image: component.image,
            count: component.amount)
        tableView.reloadRows(at: [componentIndexPath], with: .none)

    }

    func appendNewIngredient(component: Potion, componentType: RecipeComponentType, componentIndexPath: IndexPath) {

        switch componentType {
        case .inputNew:
            recipe.ingredientsInRecipe.append(component)

            if recipe.ingredientsInRecipe.count >= 4 {
                tableContents.remove(at: componentIndexPath.row)
                tableView.deleteRows(at: [componentIndexPath], with: .none)
            }

        case .outputNew:
            recipe.potionsInRecipe.append(component)

            if recipe.potionsInRecipe.count >= 2 {
                tableContents.remove(at: componentIndexPath.row)
                tableView.deleteRows(at: [componentIndexPath], with: .none)
            }

        default:
            print("error, unknown component type")
        }

        tableContents.insert( RecipeDetailViewController.TableRowContent.component(
            name: component.name,
            image: component.image,
            count: component.amount), at: componentIndexPath.row)
        tableView.insertRows(at: [componentIndexPath], with: .none)
    }
}
