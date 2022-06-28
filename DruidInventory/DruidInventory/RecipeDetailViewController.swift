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
    var viewOrder = [RecipeDetailLayout]()

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
        view.backgroundColor = .red
        configTableViewLayout()
        appendItemsToView()

        print(viewOrder)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return recipe.potionsInRecipe.count + recipe.ingredientsInRecipe.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "detailRecipe",
            for: indexPath) as? RecipeDetailCell else {fatalError("Issue loading cell")}

        return cell
    }

    func configTableViewLayout() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(RecipeDetailCell.self, forCellReuseIdentifier: "detailRecipe")
    }

    func appendItemsToView() {

        for ingredient in recipe.ingredientsInRecipe {
            viewOrder.append(
                RecipeDetailLayout(
                    amount: "\(ingredient.amount)x",
                    image: ingredient.image,
                    name: ingredient.name))
        }
        if recipe.ingredientsInRecipe.count < 4 {
            viewOrder.append(RecipeDetailLayout(amount: "", image: "plus", name: "addIngredient"))
        }
        viewOrder.append(RecipeDetailLayout(amount: "", image: "arrow.down", name: "resultsIn"))
        for potion in recipe.potionsInRecipe {
            viewOrder.append(RecipeDetailLayout(
                amount: "\(potion.amount)x",
                image: potion.image,
                name: potion.name))
        }
        if recipe.potionsInRecipe.count < 2 {
            viewOrder.append(RecipeDetailLayout(amount: "", image: "plus", name: "addPotion"))
        }
    }
}
