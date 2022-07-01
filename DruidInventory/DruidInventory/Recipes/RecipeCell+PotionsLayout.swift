//
//  RecipeCell+PotionsLayout.swift
//  DruidInventory
//
//  Created by Patrick on 27.06.2022..
//

import UIKit

extension RecipeCell {

    func configPotionsStack() {

        contentView.addSubview(potionsStack)
        potionsStack.translatesAutoresizingMaskIntoConstraints = false

        potionsStack.axis = .horizontal
        potionsStack.distribution = .equalSpacing
        potionsStack.alignment = .center
        potionsStack.spacing = CGFloat(30)

        let trailingConstant = 60 - 30 * (potions.count - 1)

        NSLayoutConstraint.activate([
            potionsStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            potionsStack.leadingAnchor.constraint(
                equalTo: resultsIn.trailingAnchor,
                constant: CGFloat(trailingConstant))
        ])

        setupPotionsLayout()
    }

    func setupPotionsLayout() {

        for potion in potions {
            let potionView = RecipeContentView(image: potion.image)
            potionsStack.addArrangedSubview(potionView.imageView)
            potionView.imageView.translatesAutoresizingMaskIntoConstraints = false
            potionView.configImageViewLayout()
            NSLayoutConstraint.activate([
                potionView.imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ])
        }
    }
}
