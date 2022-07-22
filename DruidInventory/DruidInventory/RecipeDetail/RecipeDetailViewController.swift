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
            validateRecipe()
        }
    }

    var buttonTitle = "DONE"
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
        if recipe.ingredientsInRecipe.count < 1 && recipe.potionsInRecipe.count < 1 {
            buttonTitle = "BACK"
        }
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: buttonTitle,
            style: .done,
            target: self,
            action: #selector(dismissOnTap))

        if recipe.local {
            appendPlusButtons()
        }

        configTableViewLayout()
        appendItemsToContent()
        validateRecipe()
        view.backgroundColor = ColorContainer.backgroundColor
    }

    @objc func dismissOnTap () {
        dismiss(animated: true)
    }

    func filterComponents(recipe: Recipe) -> [Potion] {
        var usedComponents = [UUID]()

        for ingredient in recipe.ingredientsInRecipe {
            usedComponents.append(ingredient.id)
        }

        for potion in recipe.potionsInRecipe {
            usedComponents.append(potion.id)
        }
        let potions = PotionContainer.shared.getAllPotions()
        return  potions.filter {!usedComponents.contains($0.id)}
    }
}

extension RecipeDetailViewController.TableRowContent: Equatable {
}
