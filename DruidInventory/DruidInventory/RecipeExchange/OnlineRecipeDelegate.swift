//
//  OnlineRecipeDelegate.swift
//  DruidInventory
//
//  Created by Patrick on 22.07.2022..
//

import UIKit

protocol OnlineRecipeDelegate: AnyObject {
    func recipeDidDownload(id: UUID)
}
