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

        case plusButton
        case downArrow
        case makeButton
        case component(name: String, image: String, count: Int)
    }

    var tableContents: [TableRowContent] = [.plusButton, .downArrow, .plusButton, .makeButton]

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
        case .plusButton:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "RecipeDetailPlusCell",
                for: indexPath) as? RecipeDetailPlusCell else {
                fatalError("Loading plus cell error")
            }
            cell.initializeCell()
            return cell

        case .downArrow:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "RecipeDetailResultsInCell",
                for: indexPath) as? RecipeDetailResultsInCell else {
                fatalError("Loading downArrow cell error")
            }
            cell.initializeCell()
            return cell

        case .makeButton:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "RecipeDetailMakeButtonCell",
                for: indexPath) as? RecipeDetailMakeButtonCell else {
                fatalError("Loading makeButton cell error")
            }
            return cell

        case .component(let name, let image, let count):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "RecipeDetailComponentCell",
                for: indexPath) as? RecipeDetailComponentCell else {
                fatalError("Loading component cell error")
            }
            cell.initializeCell(name: name, image: image, count: count)
            return cell
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension UITableViewCell {
    static var defaultReuseIdentifier: String {String(describing: self)}

    static func register(in tableView: UITableView) {
        tableView.register(self, forCellReuseIdentifier: defaultReuseIdentifier)
    }

    static func dequeue(in tableView: UITableView, for indexPath: IndexPath) -> Self {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: defaultReuseIdentifier,
            for: indexPath) as? Self else {fatalError("Cell loading error")}

        return cell
    }
}

extension RecipeDetailViewController.TableRowContent: Equatable {
    static func == (
        lhs: RecipeDetailViewController.TableRowContent,
        rhs: RecipeDetailViewController.TableRowContent) -> Bool {
        switch (lhs, rhs) {
        case (.downArrow, .downArrow):
            return true
        case (.makeButton, .makeButton):
            return true
        default:
            return false
        }
    }
}
