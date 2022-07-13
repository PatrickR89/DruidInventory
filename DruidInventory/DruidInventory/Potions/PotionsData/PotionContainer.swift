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
            Potion(name: "Fast walk", image: "figure.walk", amount: 3, id: UUID()),
            Potion(name: "Shapeshift", image: "pawprint.fill", amount: 0, id: UUID()),
            Potion(name: "Healing", image: "cross.vial", amount: 5, id: UUID()),
            Potion(name: "Stanmina", image: "line.3.crossed.swirl.circle.fill", amount: 7, id: UUID()),
            Potion(name: "Invisibility", image: "person", amount: 3, id: UUID()),
            Potion(name: "Temporary strength", image: "hand.point.up", amount: 2, id: UUID())
        ]

    }

    func changePotionName(name: String, id: UUID) {

        if let index = PotionContainer.shared.potions.firstIndex(where: {$0.id == id}) {
            PotionContainer.shared.potions[index].name = name
            delegate?.reloadTableViewById(id: id)
        }
    }

    func changePotionAmount(amount: Int, id: UUID) {

        if let index = PotionContainer.shared.potions.firstIndex(where: {$0.id == id}) {
            PotionContainer.shared.potions[index].amount = amount
            delegate?.reloadTableViewById(id: id)
        }
    }

    func changePotionImage(image: String, id: UUID) {

        if let index = PotionContainer.shared.potions.firstIndex(where: {$0.id == id}) {
            PotionContainer.shared.potions[index].image = image
            delegate?.reloadTableViewById(id: id)
        }
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

    func addToPotionsByRecipe(amount: Int, id: UUID) {

        if let index = PotionContainer.shared.potions.firstIndex(where: {$0.id == id}) {
            PotionContainer.shared.potions[index].amount += amount
            delegate?.reloadTableViewById(id: id)
        }
    }

    func removeFromPotionsByRecipe(amount: Int, id: UUID) {

        if let index = PotionContainer.shared.potions.firstIndex(where: {$0.id == id}) {
            PotionContainer.shared.potions[index].amount -= amount
            delegate?.reloadTableViewById(id: id)
        }
    }

}
