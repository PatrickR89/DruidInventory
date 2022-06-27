//
//  Recipes+IngredientsLayout.swift
//  DruidInventory
//
//  Created by Patrick on 27.06.2022..
//

import UIKit

extension RecipeCell {

    func configIngredientsLayoutIfOne() {
        contentView.addSubview(ingredient1Image)
        ingredient1Image.translatesAutoresizingMaskIntoConstraints = false
        ingredient1Image.layer.borderColor = UIColor.black.cgColor
        ingredient1Image.layer.borderWidth = 0.5

        contentView.addSubview(ingredient1Amount)
        ingredient1Amount.translatesAutoresizingMaskIntoConstraints = false
        ingredient1Amount.text = "1x"

        NSLayoutConstraint.activate([
            ingredient1Image.widthAnchor.constraint(equalToConstant: 25),
            ingredient1Image.heightAnchor.constraint(equalToConstant: 25),
            ingredient1Image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredient1Image.trailingAnchor.constraint(equalTo: resultsIn.leadingAnchor, constant: -60),
            ingredient1Amount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredient1Amount.trailingAnchor.constraint(equalTo: ingredient1Image.leadingAnchor, constant: -5),
            resultsIn.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    func configIngredientsLayoutIfTwo() {
        contentView.addSubview(ingredient1Image)
        ingredient1Image.translatesAutoresizingMaskIntoConstraints = false
        ingredient1Image.layer.borderColor = UIColor.black.cgColor
        ingredient1Image.layer.borderWidth = 0.5

        contentView.addSubview(ingredient1Amount)
        ingredient1Amount.translatesAutoresizingMaskIntoConstraints = false
        ingredient1Amount.text = "1x"

        NSLayoutConstraint.activate([
            ingredient1Image.widthAnchor.constraint(equalToConstant: 25),
            ingredient1Image.heightAnchor.constraint(equalToConstant: 25),
            ingredient1Image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredient1Image.trailingAnchor.constraint(equalTo: resultsIn.leadingAnchor, constant: -45),
            ingredient1Amount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredient1Amount.trailingAnchor.constraint(equalTo: ingredient1Image.leadingAnchor, constant: -5),
            resultsIn.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])

        contentView.addSubview(ingredient2Image)
        ingredient2Image.translatesAutoresizingMaskIntoConstraints = false
        ingredient2Image.layer.borderColor = UIColor.black.cgColor
        ingredient2Image.layer.borderWidth = 0.5

        contentView.addSubview(ingredient2Amount)
        ingredient2Amount.translatesAutoresizingMaskIntoConstraints = false
        ingredient2Amount.text = "1x"

        NSLayoutConstraint.activate([
            ingredient2Image.widthAnchor.constraint(equalToConstant: 25),
            ingredient2Image.heightAnchor.constraint(equalToConstant: 25),
            ingredient2Image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredient2Image.trailingAnchor.constraint(equalTo: ingredient1Amount.leadingAnchor, constant: -10),
            ingredient2Amount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredient2Amount.trailingAnchor.constraint(equalTo: ingredient2Image.leadingAnchor, constant: -5)
        ])
    }

    func configIngredientsLayoutIfThree() {
        contentView.addSubview(ingredient1Image)
        ingredient1Image.translatesAutoresizingMaskIntoConstraints = false
        ingredient1Image.layer.borderColor = UIColor.black.cgColor
        ingredient1Image.layer.borderWidth = 0.5

        contentView.addSubview(ingredient1Amount)
        ingredient1Amount.translatesAutoresizingMaskIntoConstraints = false
        ingredient1Amount.text = "1x"

        NSLayoutConstraint.activate([
            ingredient1Image.widthAnchor.constraint(equalToConstant: 25),
            ingredient1Image.heightAnchor.constraint(equalToConstant: 25),
            ingredient1Image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredient1Image.trailingAnchor.constraint(equalTo: resultsIn.leadingAnchor, constant: -25),
            ingredient1Amount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredient1Amount.trailingAnchor.constraint(equalTo: ingredient1Image.leadingAnchor, constant: -5),
            resultsIn.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 20)
        ])

        contentView.addSubview(ingredient2Image)
        ingredient2Image.translatesAutoresizingMaskIntoConstraints = false
        ingredient2Image.layer.borderColor = UIColor.black.cgColor
        ingredient2Image.layer.borderWidth = 0.5

        contentView.addSubview(ingredient2Amount)
        ingredient2Amount.translatesAutoresizingMaskIntoConstraints = false
        ingredient2Amount.text = "1x"

        NSLayoutConstraint.activate([
            ingredient2Image.widthAnchor.constraint(equalToConstant: 25),
            ingredient2Image.heightAnchor.constraint(equalToConstant: 25),
            ingredient2Image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredient2Image.trailingAnchor.constraint(equalTo: ingredient1Amount.leadingAnchor, constant: -10),
            ingredient2Amount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredient2Amount.trailingAnchor.constraint(equalTo: ingredient2Image.leadingAnchor, constant: -5)
        ])

        contentView.addSubview(ingredient3Image)
        ingredient3Image.translatesAutoresizingMaskIntoConstraints = false
        ingredient3Image.layer.borderColor = UIColor.black.cgColor
        ingredient3Image.layer.borderWidth = 0.5

        contentView.addSubview(ingredient3Amount)
        ingredient3Amount.translatesAutoresizingMaskIntoConstraints = false
        ingredient3Amount.text = "1x"

        NSLayoutConstraint.activate([
            ingredient3Image.widthAnchor.constraint(equalToConstant: 25),
            ingredient3Image.heightAnchor.constraint(equalToConstant: 25),
            ingredient3Image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredient3Image.trailingAnchor.constraint(equalTo: ingredient2Amount.leadingAnchor, constant: -10),
            ingredient3Amount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredient3Amount.trailingAnchor.constraint(equalTo: ingredient3Image.leadingAnchor, constant: -5)
        ])

    }

    func configIngredientsLayoutIfFour() {
        contentView.addSubview(ingredient1Image)
        ingredient1Image.translatesAutoresizingMaskIntoConstraints = false
        ingredient1Image.layer.borderColor = UIColor.black.cgColor
        ingredient1Image.layer.borderWidth = 0.5

        contentView.addSubview(ingredient1Amount)
        ingredient1Amount.translatesAutoresizingMaskIntoConstraints = false
        ingredient1Amount.text = "1x"

        NSLayoutConstraint.activate([
            ingredient1Image.widthAnchor.constraint(equalToConstant: 25),
            ingredient1Image.heightAnchor.constraint(equalToConstant: 25),
            ingredient1Image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredient1Image.trailingAnchor.constraint(equalTo: resultsIn.leadingAnchor, constant: -5),
            ingredient1Amount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredient1Amount.trailingAnchor.constraint(equalTo: ingredient1Image.leadingAnchor, constant: -3),
            resultsIn.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 60)
        ])

        contentView.addSubview(ingredient2Image)
        ingredient2Image.translatesAutoresizingMaskIntoConstraints = false
        ingredient2Image.layer.borderColor = UIColor.black.cgColor
        ingredient2Image.layer.borderWidth = 0.5

        contentView.addSubview(ingredient2Amount)
        ingredient2Amount.translatesAutoresizingMaskIntoConstraints = false
        ingredient2Amount.text = "1x"

        NSLayoutConstraint.activate([
            ingredient2Image.widthAnchor.constraint(equalToConstant: 25),
            ingredient2Image.heightAnchor.constraint(equalToConstant: 25),
            ingredient2Image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredient2Image.trailingAnchor.constraint(equalTo: ingredient1Amount.leadingAnchor, constant: -10),
            ingredient2Amount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredient2Amount.trailingAnchor.constraint(equalTo: ingredient2Image.leadingAnchor, constant: -3)
        ])

        contentView.addSubview(ingredient3Image)
        ingredient3Image.translatesAutoresizingMaskIntoConstraints = false
        ingredient3Image.layer.borderColor = UIColor.black.cgColor
        ingredient3Image.layer.borderWidth = 0.5

        contentView.addSubview(ingredient3Amount)
        ingredient3Amount.translatesAutoresizingMaskIntoConstraints = false
        ingredient3Amount.text = "1x"

        NSLayoutConstraint.activate([
            ingredient3Image.widthAnchor.constraint(equalToConstant: 25),
            ingredient3Image.heightAnchor.constraint(equalToConstant: 25),
            ingredient3Image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredient3Image.trailingAnchor.constraint(equalTo: ingredient2Amount.leadingAnchor, constant: -10),
            ingredient3Amount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredient3Amount.trailingAnchor.constraint(equalTo: ingredient3Image.leadingAnchor, constant: -3)
        ])

        contentView.addSubview(ingredient4Image)
        ingredient4Image.translatesAutoresizingMaskIntoConstraints = false
        ingredient4Image.layer.borderColor = UIColor.black.cgColor
        ingredient4Image.layer.borderWidth = 0.5

        contentView.addSubview(ingredient4Amount)
        ingredient4Amount.translatesAutoresizingMaskIntoConstraints = false
        ingredient4Amount.text = "1x"

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
