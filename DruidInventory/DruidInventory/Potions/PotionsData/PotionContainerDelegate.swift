//
//  PotionDelegate.swift
//  DruidInventory
//
//  Created by Patrick on 07.07.2022..
//

import UIKit

protocol PotionContainerDelegate: AnyObject {
    func reloadTableViewById(id: UUID)
    func appendToTableView()
}
