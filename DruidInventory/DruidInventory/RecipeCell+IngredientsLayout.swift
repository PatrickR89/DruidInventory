//
//  Recipes+IngredientsLayout.swift
//  DruidInventory
//
//  Created by Patrick on 27.06.2022..
//

import UIKit

extension RecipeCell {

    func configIngredientsLayoutIfOne() {

        configIngredient1Layout()
        setupIngredient1Constraints()

        NSLayoutConstraint.activate([
            ingredients[0].image.trailingAnchor.constraint(equalTo: resultsIn.leadingAnchor, constant: -60),
            resultsIn.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    func configIngredientsLayoutIfTwo() {

        configIngredient1Layout()
        configIngredient2Layout()

        setupIngredient1Constraints()
        setupIngredient2Constraints()

        NSLayoutConstraint.activate([
            ingredients[0].image.trailingAnchor.constraint(equalTo: resultsIn.leadingAnchor, constant: -45),
            resultsIn.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    func configIngredientsLayoutIfThree() {

        configIngredient1Layout()
        configIngredient2Layout()
        configIngredient3Layout()

        setupIngredient1Constraints()
        setupIngredient2Constraints()
        setupIngredient3Constraints()

        NSLayoutConstraint.activate([
            ingredients[0].image.trailingAnchor.constraint(equalTo: resultsIn.leadingAnchor, constant: -25),
            resultsIn.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 20)
        ])
    }

    func configIngredientsLayoutIfFour() {

        configIngredient1Layout()
        configIngredient2Layout()
        configIngredient3Layout()
        configIngredient4Layout()

        setupIngredient1Constraints()
        setupIngredient2Constraints()
        setupIngredient3Constraints()
        setupIngredient4Constraints()

        NSLayoutConstraint.activate([
            ingredients[0].image.trailingAnchor.constraint(equalTo: resultsIn.leadingAnchor, constant: -5),
            resultsIn.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 60)
        ])
    }

    func configIngredient1Layout() {
        contentView.addSubview(ingredients[0].image)
        ingredients[0].image.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(ingredients[0].amount)
        ingredients[0].amount.translatesAutoresizingMaskIntoConstraints = false
        ingredients[0].amount.text = "1x"
    }

    func configIngredient2Layout() {
        contentView.addSubview(ingredients[1].image)
        ingredients[1].image.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(ingredients[1].amount)
        ingredients[1].amount.translatesAutoresizingMaskIntoConstraints = false
        ingredients[1].amount.text = "1x"
    }

    func configIngredient3Layout() {
        contentView.addSubview(ingredients[2].image)
        ingredients[2].image.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(ingredients[2].amount)
        ingredients[2].amount.translatesAutoresizingMaskIntoConstraints = false
        ingredients[2].amount.text = "1x"
    }

    func configIngredient4Layout() {
        contentView.addSubview(ingredients[3].image)
        ingredients[3].image.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(ingredients[3].amount)
        ingredients[3].amount.translatesAutoresizingMaskIntoConstraints = false
        ingredients[3].amount.text = "1x"
    }

    func setupIngredient1Constraints() {
        NSLayoutConstraint.activate([
            ingredients[0].image.widthAnchor.constraint(equalToConstant: 25),
            ingredients[0].image.heightAnchor.constraint(equalToConstant: 25),
            ingredients[0].image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredients[0].amount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredients[0].amount.trailingAnchor.constraint(equalTo: ingredients[0].image.leadingAnchor, constant: -3)
        ])
    }

    func setupIngredient2Constraints() {
        NSLayoutConstraint.activate([
            ingredients[1].image.widthAnchor.constraint(equalToConstant: 25),
            ingredients[1].image.heightAnchor.constraint(equalToConstant: 25),
            ingredients[1].image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredients[1].image.trailingAnchor.constraint(equalTo: ingredients[0].amount.leadingAnchor, constant: -10),
            ingredients[1].amount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredients[1].amount.trailingAnchor.constraint(equalTo: ingredients[1].image.leadingAnchor, constant: -3)
        ])
    }

    func setupIngredient3Constraints() {
        NSLayoutConstraint.activate([
            ingredients[2].image.widthAnchor.constraint(equalToConstant: 25),
            ingredients[2].image.heightAnchor.constraint(equalToConstant: 25),
            ingredients[2].image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredients[2].image.trailingAnchor.constraint(equalTo: ingredients[1].amount.leadingAnchor, constant: -10),
            ingredients[2].amount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredients[2].amount.trailingAnchor.constraint(equalTo: ingredients[2].image.leadingAnchor, constant: -3)
        ])
    }

    func setupIngredient4Constraints() {
        NSLayoutConstraint.activate([
            ingredients[3].image.widthAnchor.constraint(equalToConstant: 25),
            ingredients[3].image.heightAnchor.constraint(equalToConstant: 25),
            ingredients[3].image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredients[3].image.trailingAnchor.constraint(equalTo: ingredients[2].amount.leadingAnchor, constant: -10),
            ingredients[3].amount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredients[3].amount.trailingAnchor.constraint(equalTo: ingredients[3].image.leadingAnchor, constant: -3)
        ])
    }
}
