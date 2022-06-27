//
//  RecipeCell+PotionsLayout.swift
//  DruidInventory
//
//  Created by Patrick on 27.06.2022..
//

import UIKit

extension RecipeCell {

    func configPotionsLayout() {
        setupPotionsLayout()
        setupPotionsConstraints()
    }

    func setupPotionsLayout() {

        for potion in potions {
            contentView.addSubview(potion.image)
            potion.image.translatesAutoresizingMaskIntoConstraints = false

            contentView.addSubview(potion.amount)
            potion.amount.translatesAutoresizingMaskIntoConstraints = false
            potion.amount.text = "1x"
        }
    }

    func setupPotionsConstraints() {
        for potion in potions {
            NSLayoutConstraint.activate([
                potion.image.widthAnchor.constraint(equalToConstant: 25),
                potion.image.heightAnchor.constraint(equalToConstant: 25),
                potion.image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                potion.amount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                potion.amount.trailingAnchor.constraint(equalTo: potion.image.leadingAnchor, constant: -5)
            ])
        }
        if potions.count == 1 {
            NSLayoutConstraint.activate([
                potions[0].image.leadingAnchor.constraint(equalTo: resultsIn.trailingAnchor, constant: 60)
            ])
        } else if potions.count == 2 {
            NSLayoutConstraint.activate([
                potions[1].image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                potions[0].image.trailingAnchor.constraint(equalTo: potions[1].image.leadingAnchor, constant: -30)
            ])
        }
    }
}
