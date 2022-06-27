//
//  RecipeCell+PotionsLayout.swift
//  DruidInventory
//
//  Created by Patrick on 27.06.2022..
//

import UIKit

extension RecipeCell {

    func configPotionsLayoutIfOne() {
        contentView.addSubview(potionImage1)
        potionImage1.translatesAutoresizingMaskIntoConstraints = false
        potionImage1.layer.borderColor = UIColor.black.cgColor
        potionImage1.layer.borderWidth = 0.5

        NSLayoutConstraint.activate([
            potionImage1.widthAnchor.constraint(equalToConstant: 25),
            potionImage1.heightAnchor.constraint(equalToConstant: 25),
            potionImage1.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            potionImage1.leadingAnchor.constraint(equalTo: resultsIn.trailingAnchor, constant: 60)
        ])
    }

    func configPotionsLayoutIfTwo() {
        contentView.addSubview(potionImage1)
        potionImage1.translatesAutoresizingMaskIntoConstraints = false
        potionImage1.layer.borderColor = UIColor.black.cgColor
        potionImage1.layer.borderWidth = 0.5

        NSLayoutConstraint.activate([
            potionImage1.widthAnchor.constraint(equalToConstant: 25),
            potionImage1.heightAnchor.constraint(equalToConstant: 25),
            potionImage1.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            potionImage1.leadingAnchor.constraint(equalTo: resultsIn.trailingAnchor, constant: 50)
        ])

        contentView.addSubview(potionImage2)
        potionImage2.translatesAutoresizingMaskIntoConstraints = false
        potionImage2.layer.borderColor = UIColor.black.cgColor
        potionImage2.layer.borderWidth = 0.5

        NSLayoutConstraint.activate([
            potionImage2.widthAnchor.constraint(equalToConstant: 25),
            potionImage2.heightAnchor.constraint(equalToConstant: 25),
            potionImage2.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            potionImage2.leadingAnchor.constraint(equalTo: potionImage1.trailingAnchor, constant: 30)
        ])
    }
}
