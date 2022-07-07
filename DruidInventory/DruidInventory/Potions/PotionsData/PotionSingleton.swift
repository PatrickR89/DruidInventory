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

    func changePotionName(name: String, indexPath: IndexPath) {
        PotionSingleton.shared.potions[indexPath.row].name = name
        delegate?.reloadTableViewRow(indexPath: indexPath)
    }

    func changePotionAmount(amount: Int, indexPath: IndexPath) {
        PotionSingleton.shared.potions[indexPath.row].amount = amount
        delegate?.reloadTableViewRow(indexPath: indexPath)
    }

    func changePotionImage(image: String, indexPath: IndexPath) {
        PotionSingleton.shared.potions[indexPath.row].image = image
        delegate?.reloadTableViewRow(indexPath: indexPath)
    }

    func addNewPotion(potion: Potion) {
        PotionSingleton.shared.potions.append(potion)
        delegate?.appendToTableView()
    }

    func addToPotionAmount(indexPath: IndexPath) {
        PotionSingleton.shared.potions[indexPath.row].amount += 1
        delegate?.reloadTableViewRow(indexPath: indexPath)
    }

    func reduceFromPotionAmount(indexPath: IndexPath) {
        PotionSingleton.shared.potions[indexPath.row].amount -= 1
        delegate?.reloadTableViewRow(indexPath: indexPath)
    }
}
