//
//  PotionDelegate.swift
//  DruidInventory
//
//  Created by Patrick on 07.07.2022..
//

import UIKit

protocol PotionContainerDelegate: AnyObject {
    func editedPotion(id: UUID)
    func addedNewPotion()
}
