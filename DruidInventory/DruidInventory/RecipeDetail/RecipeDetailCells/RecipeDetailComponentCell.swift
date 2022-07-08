//
//  RecipeDetailComponentCell.swift
//  DruidInventory
//
//  Created by Patrick on 28.06.2022..
//

import UIKit

class RecipeDetailComponentCell: UITableViewCell {

    var amount = UILabel()
    var imageDisplay = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configItemViewLayout()
        contentView.backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RecipeDetailComponentCell {

    func setupCell(name: String, image: String, count: Int) {
        amount.text = "\(count)x"
        imageDisplay.image = UIImage(systemName: image)
    }

    func configItemViewLayout() {
        contentView.addSubview(amount)
        amount.translatesAutoresizingMaskIntoConstraints = false
        amount.textColor = .black
        contentView.addSubview(imageDisplay)
        imageDisplay.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            amount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            amount.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -15),
            imageDisplay.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageDisplay.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 15)
        ])
    }
}
