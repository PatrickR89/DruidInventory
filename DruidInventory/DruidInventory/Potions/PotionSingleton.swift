//
//  PotionSingleton.swift
//  DruidInventory
//
//  Created by Patrick on 07.07.2022..
//

import UIKit

class PotionSingleton {
    static let shared = PotionSingleton()

    var potions: [Potion]

    weak var delegate: PotionDelegate?

    private init() {
        self.potions = [
            Potion(name: "Fast walk", image: "figure.walk", amount: 3),
            Potion(name: "Shapeshift", image: "pawprint.fill", amount: 0),
            Potion(name: "Healing", image: "cross.vial", amount: 5),
            Potion(name: "Stanmina", image: "line.3.crossed.swirl.circle.fill", amount: 7),
            Potion(name: "Invisibility", image: "person", amount: 3),
            Potion(name: "Temporary strength", image: "hand.point.up", amount: 2)
        ]

    }

}
