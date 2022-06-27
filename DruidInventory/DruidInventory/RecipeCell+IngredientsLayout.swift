//
//  Recipes+IngredientsLayout.swift
//  DruidInventory
//
//  Created by Patrick on 27.06.2022..
//

import UIKit

extension RecipeCell {

    func configIngredientsLayoutIfOne() {

        setupIngredientsLayout()
        setupIngredientsConstraints()

        NSLayoutConstraint.activate([
            ingredients[0].image.trailingAnchor.constraint(equalTo: resultsIn.leadingAnchor, constant: -60),
            resultsIn.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    func configIngredientsLayoutIfTwo() {

        setupIngredientsLayout()
        setupIngredientsConstraints()

        NSLayoutConstraint.activate([
            ingredients[0].image.trailingAnchor.constraint(equalTo: resultsIn.leadingAnchor, constant: -45),
            resultsIn.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    func configIngredientsLayoutIfThree() {

        setupIngredientsLayout()
        setupIngredientsConstraints()

        NSLayoutConstraint.activate([
            ingredients[0].image.trailingAnchor.constraint(equalTo: resultsIn.leadingAnchor, constant: -25),
            resultsIn.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 20)
        ])
    }

    func configIngredientsLayoutIfFour() {

        setupIngredientsLayout()
        setupIngredientsConstraints()

        NSLayoutConstraint.activate([
            ingredients[0].image.trailingAnchor.constraint(equalTo: resultsIn.leadingAnchor, constant: -5),
            resultsIn.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 60)
        ])
    }

    func setupIngredientsLayout() {

        for index in 0...ingredients.count - 1 {
            contentView.addSubview(ingredients[index].image)
            ingredients[index].image.translatesAutoresizingMaskIntoConstraints = false

            contentView.addSubview(ingredients[index].amount)
            ingredients[index].amount.translatesAutoresizingMaskIntoConstraints = false
            ingredients[index].amount.text = "1x"
        }
    }

    func setupIngredientsConstraints() {

        for index in 0...ingredients.count - 1 {
            NSLayoutConstraint.activate([
                ingredients[index].image.widthAnchor.constraint(equalToConstant: 25),
                ingredients[index].image.heightAnchor.constraint(equalToConstant: 25),
                ingredients[index].image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                ingredients[index].amount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                ingredients[index].amount.trailingAnchor.constraint(
                    equalTo: ingredients[index].image.leadingAnchor, constant: -3)
            ])

            if index > 0 {
                ingredients[index].image.trailingAnchor.constraint(
                    equalTo: ingredients[index - 1].amount.leadingAnchor,
                    constant: -10).isActive = true
            }
        }
    }
}
