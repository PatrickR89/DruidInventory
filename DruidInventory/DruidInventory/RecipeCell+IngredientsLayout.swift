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
            ingredient1Image.trailingAnchor.constraint(equalTo: resultsIn.leadingAnchor, constant: -60),
            resultsIn.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    func configIngredientsLayoutIfTwo() {

        configIngredient1Layout()
        configIngredient2Layout()

        setupIngredient1Constraints()
        setupIngredient2Constraints()

        NSLayoutConstraint.activate([
            ingredient1Image.trailingAnchor.constraint(equalTo: resultsIn.leadingAnchor, constant: -45),
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
            ingredient1Image.trailingAnchor.constraint(equalTo: resultsIn.leadingAnchor, constant: -25),
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
            ingredient1Image.trailingAnchor.constraint(equalTo: resultsIn.leadingAnchor, constant: -5),
            resultsIn.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 60)
        ])
    }

    func configIngredient1Layout() {
        contentView.addSubview(ingredient1Image)
        ingredient1Image.translatesAutoresizingMaskIntoConstraints = false
        ingredient1Image.layer.borderColor = UIColor.black.cgColor
        ingredient1Image.layer.borderWidth = 0.5

        contentView.addSubview(ingredient1Amount)
        ingredient1Amount.translatesAutoresizingMaskIntoConstraints = false
        ingredient1Amount.text = "1x"
    }

    func configIngredient2Layout() {
        contentView.addSubview(ingredient2Image)
        ingredient2Image.translatesAutoresizingMaskIntoConstraints = false
        ingredient2Image.layer.borderColor = UIColor.black.cgColor
        ingredient2Image.layer.borderWidth = 0.5

        contentView.addSubview(ingredient2Amount)
        ingredient2Amount.translatesAutoresizingMaskIntoConstraints = false
        ingredient2Amount.text = "1x"
    }

    func configIngredient3Layout() {
        contentView.addSubview(ingredient3Image)
        ingredient3Image.translatesAutoresizingMaskIntoConstraints = false
        ingredient3Image.layer.borderColor = UIColor.black.cgColor
        ingredient3Image.layer.borderWidth = 0.5

        contentView.addSubview(ingredient3Amount)
        ingredient3Amount.translatesAutoresizingMaskIntoConstraints = false
        ingredient3Amount.text = "1x"
    }

    func configIngredient4Layout() {
        contentView.addSubview(ingredient4Image)
        ingredient4Image.translatesAutoresizingMaskIntoConstraints = false
        ingredient4Image.layer.borderColor = UIColor.black.cgColor
        ingredient4Image.layer.borderWidth = 0.5

        contentView.addSubview(ingredient4Amount)
        ingredient4Amount.translatesAutoresizingMaskIntoConstraints = false
        ingredient4Amount.text = "1x"
    }

    func setupIngredient1Constraints() {
        NSLayoutConstraint.activate([
            ingredient1Image.widthAnchor.constraint(equalToConstant: 25),
            ingredient1Image.heightAnchor.constraint(equalToConstant: 25),
            ingredient1Image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredient1Amount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredient1Amount.trailingAnchor.constraint(equalTo: ingredient1Image.leadingAnchor, constant: -3)
        ])
    }

    func setupIngredient2Constraints() {
        NSLayoutConstraint.activate([
            ingredient2Image.widthAnchor.constraint(equalToConstant: 25),
            ingredient2Image.heightAnchor.constraint(equalToConstant: 25),
            ingredient2Image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredient2Image.trailingAnchor.constraint(equalTo: ingredient1Amount.leadingAnchor, constant: -10),
            ingredient2Amount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredient2Amount.trailingAnchor.constraint(equalTo: ingredient2Image.leadingAnchor, constant: -3)
        ])
    }

    func setupIngredient3Constraints() {
        NSLayoutConstraint.activate([
            ingredient3Image.widthAnchor.constraint(equalToConstant: 25),
            ingredient3Image.heightAnchor.constraint(equalToConstant: 25),
            ingredient3Image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredient3Image.trailingAnchor.constraint(equalTo: ingredient2Amount.leadingAnchor, constant: -10),
            ingredient3Amount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredient3Amount.trailingAnchor.constraint(equalTo: ingredient3Image.leadingAnchor, constant: -3)
        ])
    }

    func setupIngredient4Constraints() {
        NSLayoutConstraint.activate([
            ingredient4Image.widthAnchor.constraint(equalToConstant: 25),
            ingredient4Image.heightAnchor.constraint(equalToConstant: 25),
            ingredient4Image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredient4Image.trailingAnchor.constraint(equalTo: ingredient3Amount.leadingAnchor, constant: -10),
            ingredient4Amount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredient4Amount.trailingAnchor.constraint(equalTo: ingredient4Image.leadingAnchor, constant: -3)
        ])
    }
}
