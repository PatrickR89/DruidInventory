//
//  RecipesExchangeTableViewController.swift
//  DruidInventory
//
//  Created by Patrick on 22.07.2022..
//

import UIKit

class RecipesExchangeTableViewController: UITableViewController {

    var onlineRecipesOrder = [UUID]()

    override func viewWillAppear(_ animated: Bool) {
        OnlineRecipesContainer.shared.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configTableViewLayout()
        view.backgroundColor = ColorContainer.backgroundColor

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "DONE",
            style: .done,
            target: self,
            action: #selector(dismissOnTap))
    }

    @objc func dismissOnTap() {
        self.dismiss(animated: true)
    }

}

extension RecipesExchangeTableViewController: OnlineRecipeDelegate {
    func recipeDidUpload() {
        let section = tableView.numberOfSections - 1
        let row = tableView.numberOfRows(inSection: section) - 1
        let indexPath = IndexPath(row: row, section: section)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }

    func recipeDidDownload(id: UUID) {
        guard let index = onlineRecipesOrder.firstIndex(where: {$0 == id}) else {return}
        let section = tableView.numberOfSections - 1
        let indexPath = IndexPath(row: index, section: section)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
