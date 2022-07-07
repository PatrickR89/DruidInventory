//
//  RecipeDetailViewController+TV_Delegate_DataSource.swift
//  DruidInventory
//
//  Created by Patrick on 07.07.2022..
//

import UIKit

extension RecipeDetailViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableContents.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let content = tableContents[indexPath.row]

        switch content {
        case .plusButton(let type):
            let cell = RecipeDetailPlusCell.dequeue(in: tableView, for: indexPath)
            cell.setupCell(typeOfComponent: type)
            return cell

        case .downArrow:
            let cell = RecipeDetailResultsInCell.dequeue(in: tableView, for: indexPath)

            cell.setupCell()
            return cell

        case .makeButton:
            let cell = RecipeDetailMakeButtonCell.dequeue(in: tableView, for: indexPath)

            return cell

        case .component(let name, let image, let count):
            let cell = RecipeDetailComponentCell.dequeue(in: tableView, for: indexPath)

            cell.setupCell(name: name, image: image, count: count)
            return cell
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let content = tableContents[indexPath.row]

        switch content {
        case .plusButton(let type):
            print("add \(type) at \(indexPath)")
            let tempComponent = Potion(name: "", image: "", amount: 0)
            recipeComponentManipulation(
                type: type,
                recipe: recipe,
                component: tempComponent,
                componentIndexPath: indexPath)
        case .downArrow:
            print("down arrow \(indexPath)")
        case .makeButton:
            print("make button \(indexPath)")
        case .component(let name, let image, let count):
            print("component \(name) at \(indexPath)")

            if let index = tableContents.firstIndex(of: RecipeDetailViewController.TableRowContent.downArrow) {
                let type: RecipeComponentType
                if indexPath.row < index {
                    type = RecipeComponentType.inputChange
                } else {
                    type = RecipeComponentType.outputChange
                }

                let tempComponent = Potion(name: name, image: image, amount: count)
                recipeComponentManipulation(
                    type: type,
                    recipe: recipe,
                    component: tempComponent,
                    componentIndexPath: indexPath)
            }
        }
    }
}
