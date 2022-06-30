//
//  RecipeDetailCell+Layout.swift
//  DruidInventory
//
//  Created by Patrick on 28.06.2022..
//

import UIKit

extension RecipeDetailComponentCell {

    func configItemViewLayout() {
        contentView.addSubview(amount)
        amount.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageDisplay)
        imageDisplay.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            amount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            amount.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -15),
            imageDisplay.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageDisplay.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 15)
        ])
    }
}

extension RecipeDetailAddCell {

    func configAddViewLayout() {
        contentView.addSubview(imageDisplay)
        imageDisplay.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageDisplay.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageDisplay.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}

extension RecipeDetailResultsInCell {

    func configResultsInView() {
        contentView.addSubview(image1Display)
        contentView.addSubview(image2Display)

        image1Display.translatesAutoresizingMaskIntoConstraints = false
        image2Display.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            image1Display.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image1Display.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -30),
            image2Display.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image2Display.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 30)
        ])
    }
}
