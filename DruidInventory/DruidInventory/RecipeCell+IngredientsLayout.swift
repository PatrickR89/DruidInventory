//
//  Recipes+IngredientsLayout.swift
//  DruidInventory
//
//  Created by Patrick on 27.06.2022..
//

import UIKit

extension RecipeCell {

    func configIngredientsLayoutIfOne() {
        contentView.addSubview(ingredientImage1)
        ingredientImage1.translatesAutoresizingMaskIntoConstraints = false
        ingredientImage1.layer.borderColor = UIColor.black.cgColor
        ingredientImage1.layer.borderWidth = 0.5

        NSLayoutConstraint.activate([
            ingredientImage1.widthAnchor.constraint(equalToConstant: 25),
            ingredientImage1.heightAnchor.constraint(equalToConstant: 25),
            ingredientImage1.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredientImage1.trailingAnchor.constraint(equalTo: resultsIn.leadingAnchor, constant: -60)
        ])
    }

    func configIngredientsLayoutIfTwo() {
        contentView.addSubview(ingredientImage1)
        ingredientImage1.translatesAutoresizingMaskIntoConstraints = false
        ingredientImage1.layer.borderColor = UIColor.black.cgColor
        ingredientImage1.layer.borderWidth = 0.5

        NSLayoutConstraint.activate([
            ingredientImage1.widthAnchor.constraint(equalToConstant: 25),
            ingredientImage1.heightAnchor.constraint(equalToConstant: 25),
            ingredientImage1.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredientImage1.trailingAnchor.constraint(equalTo: resultsIn.leadingAnchor, constant: -45)
        ])

        contentView.addSubview(ingredientImage2)
        ingredientImage2.translatesAutoresizingMaskIntoConstraints = false
        ingredientImage2.layer.borderColor = UIColor.black.cgColor
        ingredientImage2.layer.borderWidth = 0.5

        NSLayoutConstraint.activate([
            ingredientImage2.widthAnchor.constraint(equalToConstant: 25),
            ingredientImage2.heightAnchor.constraint(equalToConstant: 25),
            ingredientImage2.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredientImage2.trailingAnchor.constraint(equalTo: ingredientImage1.leadingAnchor, constant: -15)
        ])
    }

    func configIngredientsLayoutIfThree() {
        contentView.addSubview(ingredientImage1)
        ingredientImage1.translatesAutoresizingMaskIntoConstraints = false
        ingredientImage1.layer.borderColor = UIColor.black.cgColor
        ingredientImage1.layer.borderWidth = 0.5

        NSLayoutConstraint.activate([
            ingredientImage1.widthAnchor.constraint(equalToConstant: 25),
            ingredientImage1.heightAnchor.constraint(equalToConstant: 25),
            ingredientImage1.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredientImage1.trailingAnchor.constraint(equalTo: resultsIn.leadingAnchor, constant: -25)
        ])

        contentView.addSubview(ingredientImage2)
        ingredientImage2.translatesAutoresizingMaskIntoConstraints = false
        ingredientImage2.layer.borderColor = UIColor.black.cgColor
        ingredientImage2.layer.borderWidth = 0.5

        NSLayoutConstraint.activate([
            ingredientImage2.widthAnchor.constraint(equalToConstant: 25),
            ingredientImage2.heightAnchor.constraint(equalToConstant: 25),
            ingredientImage2.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredientImage2.trailingAnchor.constraint(equalTo: ingredientImage1.leadingAnchor, constant: -15)
        ])

        contentView.addSubview(ingredientImage3)
        ingredientImage3.translatesAutoresizingMaskIntoConstraints = false
        ingredientImage3.layer.borderColor = UIColor.black.cgColor
        ingredientImage3.layer.borderWidth = 0.5

        NSLayoutConstraint.activate([
            ingredientImage3.widthAnchor.constraint(equalToConstant: 25),
            ingredientImage3.heightAnchor.constraint(equalToConstant: 25),
            ingredientImage3.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredientImage3.trailingAnchor.constraint(equalTo: ingredientImage2.leadingAnchor, constant: -15)
        ])

    }

    func configIngredientsLayoutIfFour() {
        contentView.addSubview(ingredientImage1)
        ingredientImage1.translatesAutoresizingMaskIntoConstraints = false
        ingredientImage1.layer.borderColor = UIColor.black.cgColor
        ingredientImage1.layer.borderWidth = 0.5

        NSLayoutConstraint.activate([
            ingredientImage1.widthAnchor.constraint(equalToConstant: 25),
            ingredientImage1.heightAnchor.constraint(equalToConstant: 25),
            ingredientImage1.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredientImage1.trailingAnchor.constraint(equalTo: resultsIn.leadingAnchor, constant: -15)
        ])

        contentView.addSubview(ingredientImage2)
        ingredientImage2.translatesAutoresizingMaskIntoConstraints = false
        ingredientImage2.layer.borderColor = UIColor.black.cgColor
        ingredientImage2.layer.borderWidth = 0.5

        NSLayoutConstraint.activate([
            ingredientImage2.widthAnchor.constraint(equalToConstant: 25),
            ingredientImage2.heightAnchor.constraint(equalToConstant: 25),
            ingredientImage2.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredientImage2.trailingAnchor.constraint(equalTo: ingredientImage1.leadingAnchor, constant: -15)
        ])

        contentView.addSubview(ingredientImage3)
        ingredientImage3.translatesAutoresizingMaskIntoConstraints = false
        ingredientImage3.layer.borderColor = UIColor.black.cgColor
        ingredientImage3.layer.borderWidth = 0.5

        NSLayoutConstraint.activate([
            ingredientImage3.widthAnchor.constraint(equalToConstant: 25),
            ingredientImage3.heightAnchor.constraint(equalToConstant: 25),
            ingredientImage3.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredientImage3.trailingAnchor.constraint(equalTo: ingredientImage2.leadingAnchor, constant: -15)
        ])

        contentView.addSubview(ingredientImage4)
        ingredientImage4.translatesAutoresizingMaskIntoConstraints = false
        ingredientImage4.layer.borderColor = UIColor.black.cgColor
        ingredientImage4.layer.borderWidth = 0.5

        NSLayoutConstraint.activate([
            ingredientImage4.widthAnchor.constraint(equalToConstant: 25),
            ingredientImage4.heightAnchor.constraint(equalToConstant: 25),
            ingredientImage4.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredientImage4.trailingAnchor.constraint(equalTo: ingredientImage3.leadingAnchor, constant: -15)
        ])

    }
}
