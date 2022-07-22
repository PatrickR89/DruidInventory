//
//  OnlineRecipeCell.swift
//  DruidInventory
//
//  Created by Patrick on 22.07.2022..
//

import UIKit

class OnlineRecipeCell: UITableViewCell {

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

        ingredients = recipe.ingredientsInRecipe.map { RecipeDetails(amount: $0.amount, image: $0.image, id: $0.id) }
        configStackView(stackView: ingredientsStack, array: ingredients)

        potions  = recipe.potionsInRecipe.map { RecipeDetails(amount: $0.amount, image: $0.image, id: $0.id) }
        configStackView(stackView: potionsStack, array: potions)
    }

    func validateRecipe(recipe: Recipe) {

        if OnlineRecipesContainer.shared.validateRecipe(
            recipe: recipe,
            validationRecipes: RecipesContainer.shared.getAllRecipes()) {
            contentView.backgroundColor = ColorContainer.disabledBackground
        } else {
            contentView.backgroundColor = ColorContainer.backgroundColor
        }
    }
}
