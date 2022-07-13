//
//  RecipeDelegate.swift
//  DruidInventory
//
//  Created by Patrick on 08.07.2022..
//

import UIKit

protocol RecipesContainerDelegate: AnyObject {
    func appendToTableView()
    func reloadTableViewRow(indexPath: IndexPath)
    func deleteTableRow(indexPath: IndexPath)
}
