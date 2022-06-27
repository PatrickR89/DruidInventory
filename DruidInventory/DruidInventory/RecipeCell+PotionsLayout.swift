//
//  RecipeCell+PotionsLayout.swift
//  DruidInventory
//
//  Created by Patrick on 27.06.2022..
//

import UIKit

extension RecipeCell {

    func configPotionsLayoutIfOne() {
        configPotion1Layout()

        NSLayoutConstraint.activate([
            potions[0].image.widthAnchor.constraint(equalToConstant: 25),
            potions[0].image.heightAnchor.constraint(equalToConstant: 25),
            potions[0].image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            potions[0].image.leadingAnchor.constraint(equalTo: resultsIn.trailingAnchor, constant: 60),
            potions[0].amount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            potions[0].amount.trailingAnchor.constraint(equalTo: potions[0].image.leadingAnchor, constant: -5)
        ])
    }

    func configPotionsLayoutIfTwo() {

        configPotion1Layout()
        configPotion2Layout()

        NSLayoutConstraint.activate([
            potions[1].image.widthAnchor.constraint(equalToConstant: 25),
            potions[1].image.heightAnchor.constraint(equalToConstant: 25),
            potions[1].image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            potions[1].image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            potions[1].amount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            potions[1].amount.trailingAnchor.constraint(equalTo: potions[1].image.leadingAnchor, constant: -5),
            potions[0].image.widthAnchor.constraint(equalToConstant: 25),
            potions[0].image.heightAnchor.constraint(equalToConstant: 25),
            potions[0].image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            potions[0].image.trailingAnchor.constraint(equalTo: potions[1].image.leadingAnchor, constant: -30),
            potions[0].amount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            potions[0].amount.trailingAnchor.constraint(equalTo: potions[0].image.leadingAnchor, constant: -5)
        ])
    }

    func configPotion1Layout() {
        contentView.addSubview(potions[0].image)
        potions[0].image.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(potions[0].amount)
        potions[0].amount.translatesAutoresizingMaskIntoConstraints = false
        potions[0].amount.text = "1x"
    }

    func configPotion2Layout() {
        contentView.addSubview(potions[1].image)
        potions[1].image.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(potions[1].amount)
        potions[1].amount.translatesAutoresizingMaskIntoConstraints = false
        potions[1].amount.text = "1x"
    }
}
