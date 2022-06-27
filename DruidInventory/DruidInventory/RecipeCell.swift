//
//  RecipeCell.swift
//  DruidInventory
//
//  Created by Patrick on 24.06.2022..
//

import UIKit

class RecipeCell: UITableViewCell {

    var ingredient1Amount = UILabel()
    var ingredient1Image = UIImageView()
    var ingredient2Amount = UILabel()
    var ingredient2Image = UIImageView()
    var ingredient3Amount = UILabel()
    var ingredient3Image = UIImageView()
    var ingredient4Amount = UILabel()
    var ingredient4Image = UIImageView()
    var ingredientsAmount = 4

    var resultsIn = UIImageView()

    var potion1Amount = UILabel()
    var potion1Image = UIImageView()
    var potion2Amount = UILabel()
    var potion2Image = UIImageView()
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
            resultsIn.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
