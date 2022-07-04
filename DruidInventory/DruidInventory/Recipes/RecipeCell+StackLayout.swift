//
//  Recipes+StackLayout.swift
//  DruidInventory
//
//  Created by Patrick on 27.06.2022..
//

import UIKit

extension RecipeCell {

    func configStackView(stack: UIStackView, array: [RecipeDetails]) {

        contentView.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false

        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = CGFloat(20)

        switch stack {

        case potionsStack:
            let trailingConstant = 60 - 30 * (potions.count - 1)

            NSLayoutConstraint.activate([
                stack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                stack.leadingAnchor.constraint(
                    equalTo: resultsIn.trailingAnchor,
                    constant: CGFloat(trailingConstant))
            ])

        case ingredientsStack:
            let leadConstant = -110 + 20 * ingredients.count

            NSLayoutConstraint.activate([
                stack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                stack.trailingAnchor.constraint(equalTo: resultsIn.leadingAnchor, constant: CGFloat(leadConstant))
            ])

        default:
            fatalError("error loading items")
        }

        for component in array {
            let itemView = RecipeContentView(image: component.image)
            stack.addArrangedSubview(itemView.imageView)
            itemView.configImageViewLayout()
            NSLayoutConstraint.activate([
                itemView.imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ])
        }
    }
}
