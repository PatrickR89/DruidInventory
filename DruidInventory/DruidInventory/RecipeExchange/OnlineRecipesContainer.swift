//
//  OnlineRecipesContainer.swift
//  DruidInventory
//
//  Created by Patrick on 22.07.2022..
//

import UIKit

class OnlineRecipesContainer {
    static let shared = OnlineRecipesContainer()

    private var onlineRecipes = [Recipe]()

    private init () {
        onlineRecipes = setupBasicRecipes()
    }

    func getAllOnlineRecipes() -> [Recipe] {
        return onlineRecipes
    }

    func findRecipe(id: UUID) -> Recipe? {
        guard let index = onlineRecipes.firstIndex(
            where: {$0.id == id}) else {
            fatalError("No such potion found")
        }

        return onlineRecipes[index]
    }
}
