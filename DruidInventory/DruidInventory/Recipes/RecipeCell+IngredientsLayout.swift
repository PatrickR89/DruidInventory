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

        NSLayoutConstraint.activate([
            ingredientsStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredientsStack.trailingAnchor.constraint(equalTo: resultsIn.leadingAnchor, constant: -20)
        ])

        setupIngredientsLayout()
    }

    func configIngredientsLayout() {

//        setupIngredientsLayout()
//        setupIngredientsConstraints()

//        let leadConstant = -110 + 20 * ingredients.count
//        let ingredientView = RecipeContentView(image: ingredients[0].image)
//        NSLayoutConstraint.activate([
//            ingredientView.trailingAnchor.constraint(
//                equalTo: resultsIn.leadingAnchor,
//                constant: CGFloat(leadConstant))
//        ])
    }

    func setupIngredientsLayout() {

        for ingredient in ingredients {
            let ingredientView = RecipeContentView(image: ingredient.image)
            ingredientsStack.addArrangedSubview(ingredientView)
            ingredientView.imageView.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                ingredientView.imageView.widthAnchor.constraint(equalToConstant: 25),
                ingredientView.imageView.heightAnchor.constraint(equalToConstant: 25)
//                ingredientView.imageView.centerYAnchor.constraint(equalTo: ingredientsStack.centerYAnchor)
            ])
        }
    }

//    func setupIngredientsConstraints() {
//
//        for ingredient in ingredients {
//            let ingredientView = RecipeContentView(image: ingredient.image)
//            NSLayoutConstraint.activate([
//                ingredientView.imageView.widthAnchor.constraint(equalToConstant: 25),
//                ingredientView.imageView.heightAnchor.constraint(equalToConstant: 25),
//                ingredientView.imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
//            ])
//        }
//
//        for index in 1...ingredients.count - 1 {
//            ingredients[index].image.trailingAnchor.constraint(
//                equalTo: ingredients[index - 1].image.leadingAnchor,
//                constant: -20).isActive = true
//        }
//    }
}
