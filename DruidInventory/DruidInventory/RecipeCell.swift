//
//  RecipeCell.swift
//  DruidInventory
//
//  Created by Patrick on 24.06.2022..
//

import UIKit

class RecipeCell: UITableViewCell {

    var ingredients = [Ingredient]()
    var ingredientImage1 = UIImageView()
    var ingredientImage2 = UIImageView()
    var ingredientImage3 = UIImageView()
    var ingredientImage4 = UIImageView()
    var ingredientsAmount = 1

    var resultsIn = UIImageView()

    var potions = [Potion]()
    var potionImage1 = UIImageView()
    var potionImage2 = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configLayoutResultsIn()
        configIngredientsLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configIngredientsLayout() {
        switch ingredientsAmount {
        default:
            contentView.addSubview(ingredientImage1)
            ingredientImage1.translatesAutoresizingMaskIntoConstraints = false
            ingredientImage1.layer.borderColor = UIColor.black.cgColor
            ingredientImage1.layer.borderWidth = 0.5

            NSLayoutConstraint.activate([
                ingredientImage1.widthAnchor.constraint(equalToConstant: 25),
                ingredientImage1.heightAnchor.constraint(equalToConstant: 25),
                ingredientImage1.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                ingredientImage1.trailingAnchor.constraint(equalTo: resultsIn.leadingAnchor, constant: -55)
            ])
        }
    }
    func configLayoutResultsIn() {
        contentView.addSubview(resultsIn)
        resultsIn.image = UIImage(systemName: "arrow.right")
        resultsIn.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            resultsIn.widthAnchor.constraint(equalToConstant: 25),
            resultsIn.heightAnchor.constraint(equalToConstant: 25),
            resultsIn.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            resultsIn.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
