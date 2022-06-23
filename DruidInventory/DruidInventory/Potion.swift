//
//  Potion.swift
//  DruidInventory
//
//  Created by Patrick on 23.06.2022..
//

import UIKit

struct Potion {
    var name: String
    var image: String
    var amount: Int

    init ( name: String, image: String, amount: Int) {
        self.name = name
        self.image = image
        self.amount = amount
    }
}
