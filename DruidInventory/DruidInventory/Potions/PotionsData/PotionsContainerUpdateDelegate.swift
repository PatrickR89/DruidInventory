//
//  PotionsToRecipesDelegate.swift
//  DruidInventory
//
//  Created by Patrick on 18.07.2022..
//

import UIKit

protocol PotionsContainerUpdateDelegate: AnyObject {
    func potionNameUpdated(id: UUID, name: String)
    func potionImageUpdated(id: UUID, image: String)
}
