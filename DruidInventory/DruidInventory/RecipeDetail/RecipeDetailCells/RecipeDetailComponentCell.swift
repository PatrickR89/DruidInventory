//
//  RecipeDetailComponentCell.swift
//  DruidInventory
//
//  Created by Patrick on 28.06.2022..
//

import UIKit

class RecipeDetailComponentCell: UITableViewCell {

    var amountLabel = UILabel()
    var type: RecipeComponentType?

    var amount = 0 {
        didSet {
            configImageColor()
        }
    }
    var imageDisplay = UIImageView()
    var id = UUID()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configItemViewLayout()
        contentView.backgroundColor = ColorContainer.backgroundColor
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RecipeDetailComponentCell {

    func setupCell(potion: Potion, type: RecipeComponentType) {
        let tempComponent = UnknownPotionsFilter.shared.identifyPotion(potion: potion)
        amountLabel.text = "\(potion.amount)x"
        self.amount = potion.amount
        imageDisplay.image = UIImage(systemName: tempComponent.image)
        self.id = potion.id
        self.type = type
        configImageColor()
    }

    func configItemViewLayout() {
        contentView.addSubview(amountLabel)
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.textColor = ColorContainer.textColor
        contentView.addSubview(imageDisplay)
        imageDisplay.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            amountLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            amountLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -15),
            imageDisplay.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageDisplay.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 15)
        ])
    }

    func configImageColor() {
        guard let potion = PotionContainer.shared.findPotion(id: id) else {return}

        if potion.amount < amount && type == .inputChange {
            imageDisplay.tintColor = ColorContainer.standardRed
        } else {
            imageDisplay.tintColor = ColorContainer.standardBlue
        }
    }
}
