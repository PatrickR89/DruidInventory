//
//  RecipesTableViewController.swift
//  DruidInventory
//
//  Created by Patrick on 23.06.2022..
//

import UIKit

class RecipesTableViewController: UITableViewController {

    var recipes = [Recipe]()
    var ingredients = [Ingredient]()

    override func viewDidLoad() {
        super.viewDidLoad()

        configTableViewLayout()
        testArray()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "recipe",
            for: indexPath) as? RecipeCell else {fatalError("Issue loading cell")}
        cell.initializeCell(recipe: recipes[indexPath.row])

        return cell
    }

    func configTableViewLayout() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(RecipeCell.self, forCellReuseIdentifier: "recipe")
    }

    func testArray() {
        let ingredient1 = Ingredient(name: "Cocoa", image: "hourglass.bottomhalf.filled", amount: 5)
        let ingredient2 = Ingredient(name: "Saw Dust", image: "paperplane.circle", amount: 2)
        let ingredient3 = Ingredient(name: "Fairy blood", image: "drop.triangle", amount: 1)
        let potion1 = Potion(name: "Unseen", image: "eyeglasses", amount: 1)
        recipes.append(Recipe(ingredientsInRecipe: [ingredient1, ingredient2, ingredient3], potionsInRecipe: [potion1]))
    }
}
