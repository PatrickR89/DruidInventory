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
        let tempIngredients = recipe.ingredientsInRecipe.map {UnknownPotionsFilter.shared.identifyPotion(potion: $0)}
        ingredients = tempIngredients.map { RecipeDetails(amount: $0.amount, image: $0.image, id: $0.id) }
        configStackView(stackView: ingredientsStack, array: ingredients)

        let tempPotions = recipe.potionsInRecipe.map {UnknownPotionsFilter.shared.identifyPotion(potion: $0)}
        potions  = tempPotions.map { RecipeDetails(amount: $0.amount, image: $0.image, id: $0.id) }
        configStackView(stackView: potionsStack, array: potions)
    }

    func validateRecipe(ingredients: [Potion]) {

        if RecipesContainer.shared.checkIngredients(ingredients: ingredients) {
            contentView.backgroundColor = ColorContainer.backgroundColor
        } else {
            contentView.backgroundColor = ColorContainer.disabledBackground
        }
    }
}
