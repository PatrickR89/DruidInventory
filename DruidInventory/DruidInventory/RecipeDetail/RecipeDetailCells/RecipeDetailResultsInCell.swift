//
//  RecipeDetailResultsInCell.swift
//  DruidInventory
//
//  Created by Patrick on 30.06.2022..
//

import UIKit

class RecipeDetailResultsInCell: UITableViewCell {

    var image1Display = UIImageView()
    var image2Display = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configResultsInView()
        contentView.backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RecipeDetailResultsInCell {

    func setupCell() {
        image1Display.image = UIImage(systemName: "arrow.down")
        image2Display.image = UIImage(systemName: "arrow.down")
    }

    func configResultsInView() {
        contentView.addSubview(image1Display)
        contentView.addSubview(image2Display)

        image1Display.translatesAutoresizingMaskIntoConstraints = false
        image2Display.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            image1Display.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image1Display.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -30),
            image2Display.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image2Display.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 30)
        ])
    }
}
