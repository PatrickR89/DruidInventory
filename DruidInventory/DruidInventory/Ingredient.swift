//
//  Ingredient.swift
//  DruidInventory
//
//  Created by Patrick on 24.06.2022..
//

import UIKit

struct Ingredient {
    var name: String
    var image: String
    var amount: Int

    init ( name: String, image: String, amount: Int) {
        self.name = name
        self.image = image
        self.amount = amount
    }
}
