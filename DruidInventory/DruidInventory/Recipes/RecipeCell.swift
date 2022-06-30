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

    func configLayoutResultsIn() {
        contentView.addSubview(resultsIn)
        resultsIn.image = UIImage(systemName: "arrow.right")
        resultsIn.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            resultsIn.widthAnchor.constraint(equalToConstant: 25),
            resultsIn.heightAnchor.constraint(equalToConstant: 25),
            resultsIn.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            resultsIn.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 60 )
        ])
    }

    func initializeCell(recipe: Recipe) {

        ingredients = recipe.ingredientsInRecipe.map { RecipeLayout(amount: "\($0.amount)x", image: $0.image) }

        ingredientsCount = ingredients.count

        potions  = recipe.potionsInRecipe.map { RecipeLayout(amount: "\($0.amount)x", image: $0.image) }

        potionsCount = potions.count
    }
}
