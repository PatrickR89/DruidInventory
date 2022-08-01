//
//  UnknownPotionsFilter.swift
//  DruidInventory
//
//  Created by Patrick on 01.08.2022..
//

import UIKit

class UnknownPotionsFilter {
    static let shared = UnknownPotionsFilter()

    let image = "questionmark"
    let name = ""

    func identifyPotion(potion: Potion) -> Potion {
        let potions = PotionContainer.shared.getAllPotions()

        var tempPotion = Potion(
            name: potion.name,
            image: potion.image,
            amount: potion.amount,
            id: potion.id )

//        if let index = potions.firstIndex(where: {$0.name == potion.name && $0.image == potion.image}) {
//            return tempPotion
//        } else {
//            tempPotion.name = self.name
//            tempPotion.image = self.image
//        }
//        return tempPotion

        if potions.contains(where: {$0.name == potion.name && $0.image == potion.image}) {
            return tempPotion
        } else {
            tempPotion.name = self.name
            tempPotion.image = self.image
            return tempPotion
        }
    }
}
