//
//  RecipeDetailViewController.swift
//  DruidInventory
//
//  Created by Patrick on 28.06.2022..
//

import UIKit

class RecipeDetailViewController: UITableViewController {

    var recipe: Recipe {
        didSet {
            if !isNewRecipe {
                RecipesSingleton.shared.changeRecipe(recipe: recipe, indexPath: recipeIndexPath)
            }

            validateRecipe()
        }
    }

    var isNewRecipe = false
    var isRecipeValid = false {
        didSet {
            tableView.reloadData()
        }
    }

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

    func validateRecipe() {

        print(recipe.ingredientsInRecipe.count >= 2 && recipe.potionsInRecipe.count >= 1)
        isRecipeValid = recipe.ingredientsInRecipe.count >= 2 && recipe.potionsInRecipe.count >= 1
    }

}

extension RecipeDetailViewController.TableRowContent: Equatable {
}
