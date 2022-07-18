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
        contentView.backgroundColor = UIColor(named: "backgroundColor")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RecipeDetailComponentCell {

    func setupCell(id: UUID, image: String, count: Int, type: RecipeComponentType) {
        amountLabel.text = "\(count)x"
        self.amount = count
        imageDisplay.image = UIImage(systemName: image)
        self.id = id
        self.type = type
        configImageColor()
    }

    func configItemViewLayout() {
        contentView.addSubview(amountLabel)
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.textColor = UIColor(named: "textColor")
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
            imageDisplay.tintColor = .red
        } else {
            imageDisplay.tintColor = .systemBlue
        }
    }
}
