//
//  RecipeCell.swift
//  DruidInventory
//
//  Created by Patrick on 24.06.2022..
//

import UIKit

class RecipeCell: UITableViewCell {

    var ingredients = [RecipeDetails]()
    var potions = [RecipeDetails]()

    var resultsIn = UIImageView()

    var ingredientsStack = UIStackView()
    var potionsStack = UIStackView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configLayoutResultsIn()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configLayoutResultsIn() {
        contentView.addSubview(resultsIn)
        resultsIn.image = UIImage(systemName: "arrow.right")
        resultsIn.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            resultsIn.widthAnchor.constraint(equalToConstant: 25),
            resultsIn.heightAnchor.constraint(equalToConstant: 25),
            resultsIn.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            resultsIn.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 50 )
        ])
    }

    func setupCell(recipe: Recipe) {

        ingredients = recipe.ingredientsInRecipe.map { RecipeDetails(amount: $0.amount, image: $0.image) }
        configStackView(stackView: ingredientsStack, array: ingredients)

        potions  = recipe.potionsInRecipe.map { RecipeDetails(amount: $0.amount, image: $0.image) }
        configStackView(stackView: potionsStack, array: potions)
    }

    func validateRecipe(ingredients: [Potion]) {
        var validationArray = [Bool]()
        for ingredient in ingredients {
            if let index = PotionSingleton.shared.potions.firstIndex(where: {$0.name == ingredient.name}) {
                validationArray.append( PotionSingleton.shared.potions[index].amount >= ingredient.amount )
            } else {
                validationArray.append(false)
            }
        }
        if validationArray.contains(false) || validationArray.isEmpty {
            contentView.backgroundColor = .lightGray
        } else {
            contentView.backgroundColor = .white
        }
    }
}
