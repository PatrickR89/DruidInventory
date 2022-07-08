//
//  RecipesTableViewController.swift
//  DruidInventory
//
//  Created by Patrick on 23.06.2022..
//

import UIKit

class RecipesTableViewController: UITableViewController {

//    var RecipesSingleton.shared.recipes = [Recipe]()
    var ingredients = [Potion]()

    override func viewWillAppear(_ animated: Bool) {
        RecipesSingleton.shared.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configTableViewLayout()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        RecipesSingleton.shared.recipes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = RecipeCell.dequeue(in: tableView, for: indexPath)
        cell.setupCell(recipe: RecipesSingleton.shared.recipes[indexPath.row])

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipeDetailView = RecipeDetailViewController(
            recipe: RecipesSingleton.shared.recipes[indexPath.row],
            recipeIndexPath: indexPath)

        self.present(recipeDetailView, animated: true)

    }

    func configTableViewLayout() {
        tableView.delegate = self
        tableView.dataSource = self
        RecipeCell.register(in: tableView)
    }
}

extension RecipesTableViewController: RecipeDelegate {
    func reloadTableViewRow(indexPath: IndexPath) {
        tableView.reloadRows(at: [indexPath], with: .none)
    }
}
