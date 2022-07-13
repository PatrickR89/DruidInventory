//
//  PotionSingleton.swift
//  DruidInventory
//
//  Created by Patrick on 07.07.2022..
//

import UIKit

class PotionContainer {
    static let shared = PotionContainer()

    var potions: [Potion]

    weak var delegate: PotionContainerDelegate?

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
        PotionContainer.shared.potions[indexPath.row].name = name
        delegate?.reloadTableViewRow(indexPath: indexPath)
    }

    func changePotionAmount(amount: Int, indexPath: IndexPath) {
        PotionContainer.shared.potions[indexPath.row].amount = amount
        delegate?.reloadTableViewRow(indexPath: indexPath)
    }

    func changePotionImage(image: String, indexPath: IndexPath) {
        PotionContainer.shared.potions[indexPath.row].image = image
        delegate?.reloadTableViewRow(indexPath: indexPath)
    }

    func addNewPotion(potion: Potion) {
        PotionContainer.shared.potions.append(potion)
        delegate?.appendToTableView()
    }

    func addToPotionAmount(indexPath: IndexPath) {
        PotionContainer.shared.potions[indexPath.row].amount += 1
        delegate?.reloadTableViewRow(indexPath: indexPath)
    }

    func reduceFromPotionAmount(indexPath: IndexPath) {
        PotionContainer.shared.potions[indexPath.row].amount -= 1
        delegate?.reloadTableViewRow(indexPath: indexPath)
    }

    func addToPotionsByRecipe(amount: Int, index: Int) {
        PotionContainer.shared.potions[index].amount += amount
        let section = PotionsTableViewController().tableView.numberOfSections - 1
        let indexPath = IndexPath(row: index, section: section)
        delegate?.reloadTableViewRow(indexPath: indexPath)
    }

    func removeFromPotionsByRecipe(amount: Int, index: Int) {
        PotionContainer.shared.potions[index].amount -= amount
        let section = PotionsTableViewController().tableView.numberOfSections - 1
        let indexPath = IndexPath(row: index, section: section)
        delegate?.reloadTableViewRow(indexPath: indexPath)
    }

}
