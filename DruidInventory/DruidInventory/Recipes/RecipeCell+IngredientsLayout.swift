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

        let leadConstant = -110 + 20 * ingredients.count

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
        }
    }

    func setupIngredientsConstraints() {

        for ingredient in ingredients {
            NSLayoutConstraint.activate([
                ingredient.image.widthAnchor.constraint(equalToConstant: 25),
                ingredient.image.heightAnchor.constraint(equalToConstant: 25),
                ingredient.image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ])
        }

        for index in 1...ingredients.count - 1 {
            ingredients[index].image.trailingAnchor.constraint(
                equalTo: ingredients[index - 1].image.leadingAnchor,
                constant: -20).isActive = true
        }
    }
}
