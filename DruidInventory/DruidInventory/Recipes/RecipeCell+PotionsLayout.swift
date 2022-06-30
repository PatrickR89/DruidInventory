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
        }
    }

    func setupPotionsConstraints() {
        for potion in potions {
            NSLayoutConstraint.activate([
                potion.image.widthAnchor.constraint(equalToConstant: 25),
                potion.image.heightAnchor.constraint(equalToConstant: 25),
                potion.image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ])
        }
        if potions.count == 1 {
            NSLayoutConstraint.activate([
                potions[0].image.leadingAnchor.constraint(equalTo: resultsIn.trailingAnchor, constant: 50)
            ])
        } else if potions.count == 2 {
            NSLayoutConstraint.activate([
                potions[1].image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
                potions[0].image.trailingAnchor.constraint(equalTo: potions[1].image.leadingAnchor, constant: -30)
            ])
        }
    }
}
