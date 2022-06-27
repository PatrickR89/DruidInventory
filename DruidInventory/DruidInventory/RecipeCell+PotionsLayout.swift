//
//  RecipeCell+PotionsLayout.swift
//  DruidInventory
//
//  Created by Patrick on 27.06.2022..
//

import UIKit

extension RecipeCell {

    func configPotionsLayoutIfOne() {
        configPotion1Layout()

        NSLayoutConstraint.activate([
            potion1Image.widthAnchor.constraint(equalToConstant: 25),
            potion1Image.heightAnchor.constraint(equalToConstant: 25),
            potion1Image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            potion1Image.leadingAnchor.constraint(equalTo: resultsIn.trailingAnchor, constant: 60),
            potion1Amount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            potion1Amount.trailingAnchor.constraint(equalTo: potion1Image.leadingAnchor, constant: -5)
        ])
    }

    func configPotionsLayoutIfTwo() {

        configPotion1Layout()
        configPotion2Layout()

        NSLayoutConstraint.activate([
            potion2Image.widthAnchor.constraint(equalToConstant: 25),
            potion2Image.heightAnchor.constraint(equalToConstant: 25),
            potion2Image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            potion2Image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            potion2Amount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            potion2Amount.trailingAnchor.constraint(equalTo: potion2Image.leadingAnchor, constant: -5),
            potion1Image.widthAnchor.constraint(equalToConstant: 25),
            potion1Image.heightAnchor.constraint(equalToConstant: 25),
            potion1Image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            potion1Image.trailingAnchor.constraint(equalTo: potion2Image.leadingAnchor, constant: -30),
            potion1Amount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            potion1Amount.trailingAnchor.constraint(equalTo: potion1Image.leadingAnchor, constant: -5)
        ])
    }

    func configPotion1Layout() {
        contentView.addSubview(potion1Image)
        potion1Image.translatesAutoresizingMaskIntoConstraints = false
        potion1Image.layer.borderColor = UIColor.black.cgColor
        potion1Image.layer.borderWidth = 0.5

        contentView.addSubview(potion1Amount)
        potion1Amount.translatesAutoresizingMaskIntoConstraints = false
        potion1Amount.text = "1x"
    }

    func configPotion2Layout() {
        contentView.addSubview(potion2Image)
        potion2Image.translatesAutoresizingMaskIntoConstraints = false
        potion2Image.layer.borderColor = UIColor.black.cgColor
        potion2Image.layer.borderWidth = 0.5

        contentView.addSubview(potion2Amount)
        potion2Amount.translatesAutoresizingMaskIntoConstraints = false
        potion2Amount.text = "1x"
    }
}
