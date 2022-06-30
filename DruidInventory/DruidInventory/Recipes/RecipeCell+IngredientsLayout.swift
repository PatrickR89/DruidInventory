//
//  Recipes+IngredientsLayout.swift
//  DruidInventory
//
//  Created by Patrick on 27.06.2022..
//

import UIKit

extension RecipeCell {

    func configIngredientsLayout() {

        setupIngredientsLayout()
        setupIngredientsConstraints()

        var leadConstant = -5

        switch ingredients.count {
        case 1:
            leadConstant = -60
        case 2:
            leadConstant = -55
        case 3:
            leadConstant = -40
        default:
            leadConstant = -5
        }

        NSLayoutConstraint.activate([
            ingredients[0].image.trailingAnchor.constraint(
                equalTo: resultsIn.leadingAnchor,
                constant: CGFloat(leadConstant))
        ])
    }

    func setupIngredientsLayout() {

        for ingredient in ingredients {
            contentView.addSubview(ingredient.image)
            ingredient.image.translatesAutoresizingMaskIntoConstraints = false

            contentView.addSubview(ingredient.amount)
            ingredient.amount.translatesAutoresizingMaskIntoConstraints = false
            ingredient.amount.text = "1x"
        }
    }

    func setupIngredientsConstraints() {

        for ingredient in ingredients {
            NSLayoutConstraint.activate([
                ingredient.image.widthAnchor.constraint(equalToConstant: 25),
                ingredient.image.heightAnchor.constraint(equalToConstant: 25),
                ingredient.image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                ingredient.amount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                ingredient.amount.trailingAnchor.constraint(
                    equalTo: ingredient.image.leadingAnchor, constant: -3)
            ])
        }

        for index in 1...ingredients.count - 1 {
            ingredients[index].image.trailingAnchor.constraint(
                equalTo: ingredients[index - 1].amount.leadingAnchor,
                constant: -10).isActive = true
        }
    }
}
