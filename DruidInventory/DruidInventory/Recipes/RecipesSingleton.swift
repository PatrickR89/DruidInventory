//
//  RecipesSingleton.swift
//  DruidInventory
//
//  Created by Patrick on 07.07.2022..
//

import UIKit

class RecipesSingleton {
    static let shared = RecipesSingleton()

    var recipes = [Recipe]()

    private init() {
        self.recipes = testArray()
    }

}
