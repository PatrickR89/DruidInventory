//
//  RecipeDetailPlusCell.swift
//  DruidInventory
//
//  Created by Patrick on 30.06.2022..
//

import UIKit

class RecipeDetailPlusCell: UITableViewCell {

    var imageDisplay = UIImageView()
    var componentType: RecipeComponentType = .inputNew

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configPlusViewLayout()
        contentView.backgroundColor = ColorContainer.backgroundColor
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RecipeDetailPlusCell {

    func setupCell(typeOfComponent: RecipeComponentType) {
        imageDisplay.image = ButtonIcons.plusButton
        componentType = typeOfComponent
    }

    func configPlusViewLayout() {
        contentView.addSubview(imageDisplay)
        imageDisplay.translatesAutoresizingMaskIntoConstraints = false
        imageDisplay.tintColor = ColorContainer.standardBlue

        NSLayoutConstraint.activate([
            imageDisplay.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageDisplay.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}
