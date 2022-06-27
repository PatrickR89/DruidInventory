//
//  RecipeCell.swift
//  DruidInventory
//
//  Created by Patrick on 24.06.2022..
//

import UIKit

class RecipeCell: UITableViewCell {

    var ingredientsCount = 4 {
        didSet {
            configIngredientsLayout()
        }
    }
    var ingredient1Amount = UILabel()
    var ingredient1Image = UIImageView()
    var ingredient2Amount = UILabel()
    var ingredient2Image = UIImageView()
    var ingredient3Amount = UILabel()
    var ingredient3Image = UIImageView()
    var ingredient4Amount = UILabel()
    var ingredient4Image = UIImageView()

    var resultsIn = UIImageView()

    var potionsCount = 2 {
        didSet {
            configPotionsLayout()
        }
    }
    var potion1Amount = UILabel()
    var potion1Image = UIImageView()
    var potion2Amount = UILabel()
    var potion2Image = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configLayoutResultsIn()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configIngredientsLayout() {
        switch ingredientsCount {
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
        switch potionsCount {
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

    func initializeCell(recipe: Recipe) {

        ingredientsCount = recipe.ingredientsInRecipe.count

        ingredient1Amount.text = "\(recipe.ingredientsInRecipe[0].amount)x"
        ingredient1Image.image = UIImage(systemName: recipe.ingredientsInRecipe[0].image)
        ingredient2Amount.text = "\(recipe.ingredientsInRecipe[1].amount)x"
        ingredient2Image.image = UIImage(systemName: recipe.ingredientsInRecipe[1].image)
        ingredient3Amount.text = "\(recipe.ingredientsInRecipe[2].amount)x"
        ingredient3Image.image = UIImage(systemName: recipe.ingredientsInRecipe[2].image)
//        ingredient4Amount.text = "\(recipe.ingredientsInRecipe[3].amount)x"
//        ingredient4Image.image = UIImage(systemName: recipe.ingredientsInRecipe[3].image)

        potionsCount = recipe.potionsInRecipe.count

        potion1Image.image = UIImage(systemName: recipe.potionsInRecipe[0].image)
        potion1Amount.text = "\(recipe.potionsInRecipe[0].amount)x"
    }
}
