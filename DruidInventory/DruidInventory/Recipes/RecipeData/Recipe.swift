//
//  Recipe.swift
//  DruidInventory
//
//  Created by Patrick on 24.06.2022..
//

import UIKit

struct Recipe: Codable {
    var ingredientsInRecipe: [Potion]
    var potionsInRecipe: [Potion]
}
