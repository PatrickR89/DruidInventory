//
//  RecipeCell.swift
//  DruidInventory
//
//  Created by Patrick on 24.06.2022..
//

import UIKit

class RecipeCell: UITableViewCell {

    var ingredientImage1 = UIImageView()
    var ingredientImage2 = UIImageView()
    var ingredientImage3 = UIImageView()
    var ingredientImage4 = UIImageView()
    var ingredientsAmount = 4

    var resultsIn = UIImageView()

    var potionImage1 = UIImageView()
    var potionImage2 = UIImageView()
    var potionsAmount = 2

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configLayoutResultsIn()
        configIngredientsLayout()
        configPotionsLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configIngredientsLayout() {
        switch ingredientsAmount {
        case 2:
            configIngredientsLayoutIfTwo()

        case 3:
            configIngredientsLayoutIfThree()

        case 4:
            configIngredientsLayoutIfFour()

        default:
            configIngredientsLayoutIfOne()
        }
    }

    func configPotionsLayout() {
        switch potionsAmount {
        case 2:
            configPotionsLayoutIfTwo()
        default:
            configPotionsLayoutIfOne()
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
