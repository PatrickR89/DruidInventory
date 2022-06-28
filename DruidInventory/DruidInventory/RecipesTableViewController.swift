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

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipeDetailView = RecipeDetailViewController()

        self.present(recipeDetailView, animated: true)

    }

    func configTableViewLayout() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(RecipeCell.self, forCellReuseIdentifier: "recipe")
    }
}
