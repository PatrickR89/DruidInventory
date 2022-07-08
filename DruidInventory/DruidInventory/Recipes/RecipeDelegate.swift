//
//  RecipeDelegate.swift
//  DruidInventory
//
//  Created by Patrick on 08.07.2022..
//

import UIKit

protocol RecipeDelegate: AnyObject {
    func reloadTableViewRow(indexPath: IndexPath)
}
