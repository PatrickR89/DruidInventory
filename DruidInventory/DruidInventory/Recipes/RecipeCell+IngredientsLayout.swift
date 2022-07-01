//
//  Recipes+IngredientsLayout.swift
//  DruidInventory
//
//  Created by Patrick on 27.06.2022..
//

import UIKit

extension RecipeCell {

    func configIngredientsStack() {

        contentView.addSubview(ingredientsStack)
        ingredientsStack.translatesAutoresizingMaskIntoConstraints = false

        ingredientsStack.axis = .horizontal
        ingredientsStack.distribution = .equalSpacing
        ingredientsStack.alignment = .center
        ingredientsStack.spacing = CGFloat(20)

        let leadConstant = -110 + 20 * ingredients.count

        NSLayoutConstraint.activate([
            ingredientsStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredientsStack.trailingAnchor.constraint(equalTo: resultsIn.leadingAnchor, constant: CGFloat(leadConstant))
        ])

        setupIngredientsLayout()
    }

    func setupIngredientsLayout() {

        for ingredient in ingredients {
            let ingredientView = RecipeContentView(image: ingredient.image)
            ingredientsStack.addArrangedSubview(ingredientView.imageView)
            ingredientView.configImageViewLayout()

            NSLayoutConstraint.activate([
                ingredientView.imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ])
        }
    }
}
