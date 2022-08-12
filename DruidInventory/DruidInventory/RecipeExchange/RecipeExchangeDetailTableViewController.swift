//
//  RecipeExchangeDetailTableViewController.swift
//  DruidInventory
//
//  Created by Patrick on 22.07.2022..
//

import UIKit

class RecipeExchangeDetailTableViewController: UITableViewController {

    var recipe: Recipe

    var buttonTitle = "BACK"

    enum TableRowContent {

        case downArrow
        case downloadBtn
        case component(name: String, image: String, count: Int, id: UUID)
    }

    var tableContents: [TableRowContent] = [.downArrow, .downloadBtn]

    required init(recipe: Recipe) {
        self.recipe = recipe

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

        configTableViewLayout()
        appendItemsToContent()
        view.backgroundColor = ColorContainer.backgroundColor
    }

    @objc func dismissOnTap () {
        dismiss(animated: true)
    }
}

extension RecipeExchangeDetailTableViewController.TableRowContent: Equatable {
}
