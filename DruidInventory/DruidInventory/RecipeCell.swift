//
//  RecipeCell.swift
//  DruidInventory
//
//  Created by Patrick on 24.06.2022..
//

import UIKit

class RecipeCell: UITableViewCell {

    var ingredientsCount = 0 {
        didSet {
            configIngredientsLayout()
        }
    }

    var potionsCount = 0 {
        didSet {
            configPotionsLayout()
        }
    }

    var ingredients = [RecipeLayout]()
    var potions = [RecipeLayout]()

    var resultsIn = UIImageView()

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

        for index in 0...recipe.ingredientsInRecipe.count - 1 {
            ingredients.append(
                RecipeLayout(
                    amount: "\(recipe.ingredientsInRecipe[index].amount)x",
                    image: recipe.ingredientsInRecipe[index].image))
        }

        ingredientsCount = ingredients.count

        for index in 0...recipe.potionsInRecipe.count - 1 {
            potions.append(
                RecipeLayout(
                    amount: "\(recipe.potionsInRecipe[index].amount)x",
                    image: recipe.potionsInRecipe[index].image))
        }

        potionsCount = potions.count
    }
}
