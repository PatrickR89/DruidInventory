//
//  PotionsToRecipesDelegate.swift
//  DruidInventory
//
//  Created by Patrick on 18.07.2022..
//

import UIKit

protocol PotionsContainerUpdateDelegate: AnyObject {
    func potionsUpdated(potions: [Potion])
}
