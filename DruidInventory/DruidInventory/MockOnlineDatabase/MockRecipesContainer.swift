//
//  MockRecipes.swift
//  DruidInventory
//
//  Created by Patrick on 28.07.2022..
//

import UIKit

class MockRecipesContainer {
    static let shared = MockRecipesContainer()

    var onlineRecipes = [Recipe]()

    private init() {
        onlineRecipes = setupBasicRecipes()
    }

    func sendRecipes() -> [Recipe] {
        return onlineRecipes
    }
}
