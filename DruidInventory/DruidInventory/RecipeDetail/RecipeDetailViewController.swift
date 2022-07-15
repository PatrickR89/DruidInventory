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
                RecipesContainer.shared.changeRecipe(recipe: recipe)
            }
            RecipesContainer.shared.filterComponents(recipe: recipe)
            validateRecipe()
        }
    }

    var isNewRecipe = false
    var isRecipeValid = false {
        didSet {
            tableView.reloadData()
        }
    }

    enum TableRowContent {

        case plusButton(type: RecipeComponentType)
        case downArrow
        case makeButton
        case component(name: String, image: String, count: Int, id: UUID)
    }

    var tableContents: [TableRowContent] = [.downArrow, .makeButton]

    required init(recipe: Recipe) {
        self.recipe = recipe
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
        validateRecipe()
        view.backgroundColor = UIColor(named: "backgroundColor")
    }

}

extension RecipeDetailViewController.TableRowContent: Equatable {
}
