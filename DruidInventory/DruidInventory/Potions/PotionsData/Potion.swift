//
//  Potion.swift
//  DruidInventory
//
//  Created by Patrick on 23.06.2022..
//

import UIKit

struct Potion: Codable {
    var name: String
    var image: String
    var amount: Int {
        didSet {
            if amount <= 0 {
                amount = 0
            }
        }
    }

    var id: UUID

    init ( name: String, image: String, amount: Int, id: UUID) {
        self.name = name
        self.image = image
        self.amount = amount
        self.id = id
    }
}
