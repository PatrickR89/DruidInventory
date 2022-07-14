//
//  PotionSingleton.swift
//  DruidInventory
//
//  Created by Patrick on 07.07.2022..
//

import UIKit

class PotionContainer {
    static let shared = PotionContainer()

    var potions = [Potion]() {
        didSet {
            encodeAndSave()
        }
    }

    weak var delegate: PotionContainerDelegate?

    let potionsFile = FileManager().getFilePath("potionsJSON.txt")

    private init() {
        loadAndDecode()
    }

    func findPotion(id: UUID) -> Int {
        guard let index = PotionContainer.shared.potions.firstIndex(
            where: {$0.id == id}) else {
            fatalError("No such potion found")
        }
        return index
    }

    func changePotionName(name: String, id: UUID) {

        potions[findPotion(id: id)].name = name
        delegate?.editPotion(id: id)
    }

    func changePotionAmount(amount: Int, id: UUID) {

        potions[findPotion(id: id)].amount = amount
        delegate?.editPotion(id: id)
    }

    func changePotionImage(image: String, id: UUID) {

        potions[findPotion(id: id)].image = image
        delegate?.editPotion(id: id)
    }

    func addNewPotion(potion: Potion) {
        PotionContainer.shared.potions.append(potion)
        delegate?.addNewPotion()
    }

    func addOnSwipe(id: UUID) {

        potions[findPotion(id: id)].amount += 1
        delegate?.editPotion(id: id)
    }

    func reduceOnSwipe(id: UUID) {

        potions[findPotion(id: id)].amount -= 1
        delegate?.editPotion(id: id)
    }

    func createFromRecipe(amount: Int, id: UUID) {

        potions[findPotion(id: id)].amount += amount
        delegate?.editPotion(id: id)
    }

    func spendOnRecipe(amount: Int, id: UUID) {

        potions[findPotion(id: id)].amount -= amount
        delegate?.editPotion(id: id)
    }

    func encodeAndSave() {
        do {
            let potionsJSON = try JSONEncoder().encode(potions)
            try potionsJSON.write(to: potionsFile, options: .atomic)
        } catch {
            print("Error occured during saving file")
        }
    }

    func loadAndDecode() {
        do {
            let response = try String(contentsOf: potionsFile)
            let data = Data(response.utf8)
            self.potions = try JSONDecoder().decode([Potion].self, from: data)
        } catch {
            print("Error occured during loading file")
            self.potions = [
                Potion(name: "Fast walk", image: "figure.walk", amount: 3, id: UUID()),
                Potion(name: "Shapeshift", image: "pawprint.fill", amount: 0, id: UUID()),
                Potion(name: "Healing", image: "cross.vial", amount: 5, id: UUID()),
                Potion(name: "", image: "line.3.crossed.swirl.circle.fill", amount: 7, id: UUID()),
                Potion(name: "Invisibility", image: "", amount: 3, id: UUID()),
                Potion(name: "Temporary strength", image: "hand.point.up", amount: 2, id: UUID())
            ]
        }
    }
}
