//
//  PotionDelegate.swift
//  DruidInventory
//
//  Created by Patrick on 07.07.2022..
//

import UIKit

protocol PotionDelegate: AnyObject {
    func reloadTableViewRow(indexPath: IndexPath)
    func appendToTableView()
}
