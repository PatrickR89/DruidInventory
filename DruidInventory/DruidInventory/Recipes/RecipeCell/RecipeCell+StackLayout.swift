//
//  Recipes+StackLayout.swift
//  DruidInventory
//
//  Created by Patrick on 27.06.2022..
//

import UIKit

extension RecipeCell {

    func configStackView(stackView: UIStackView, array: [RecipeDetails]) {

        stackView.removeFromSuperview()
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = CGFloat(20)

        for subview in stackView.subviews {
            subview.removeFromSuperview()
        }

        switch stackView {

        case potionsStack:
            let trailingConstant = 60 - 25 * (potions.count - 1)

            NSLayoutConstraint.activate([
                stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                stackView.leadingAnchor.constraint(
                    equalTo: resultsIn.trailingAnchor,
                    constant: CGFloat(trailingConstant))
            ])

        case ingredientsStack:
            let leadConstant = -110 + 20 * ingredients.count

            NSLayoutConstraint.activate([
                stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                stackView.trailingAnchor.constraint(equalTo: resultsIn.leadingAnchor, constant: CGFloat(leadConstant))
            ])

        default:
            fatalError("error loading items")
        }

        for component in array {
            let itemView = RecipeContentView(image: component.image)
            itemView.configImageViewLayout()
            itemView.configImageColor(componentId: component.id)
            stackView.addArrangedSubview(itemView)
            NSLayoutConstraint.activate([
                itemView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ])
        }
    }
}
