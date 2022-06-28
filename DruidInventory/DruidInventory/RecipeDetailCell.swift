//
//  RecipeDetailCell.swift
//  DruidInventory
//
//  Created by Patrick on 28.06.2022..
//

import UIKit

class RecipeDetailCell: UITableViewCell {

    var amount = UILabel()
    var image1 = UIImageView()
    var image2 = UIImageView()
    var name = ""
    var type = "" {
        didSet {
            if type == "item" {
                configItemViewLayout()
            }

            if type == "addButton" {
                configAddViewLayout()
            }

            if type == "resultsIn" {
                configResultsInView()
            }
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initializeCell(itemInView: RecipeDetailLayout) {
        if itemInView.name != "addIngredient" && itemInView.name != "resultsIn" && itemInView.name != "addPotion" {
            amount.text = itemInView.amount.text
            image1.image = itemInView.image.image
            type = "item"
        }

        if itemInView.name == "addIngredient" || itemInView.name == "addPotion" {
            image1.image = itemInView.image.image
            type = "addButton"
        }

        if itemInView.name == "resultsIn" {
            image1.image = itemInView.image.image
            image2.image = itemInView.image.image
            type = "resultsIn"
        }
    }

    func configItemViewLayout() {
        contentView.addSubview(amount)
        amount.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(image1)
        image1.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            amount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            amount.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -15),
            image1.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image1.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 15)
        ])
    }

    func configAddViewLayout() {
        contentView.addSubview(image1)
        image1.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            image1.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image1.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }

    func configResultsInView() {
        contentView.addSubview(image1)
        contentView.addSubview(image2)

        image1.translatesAutoresizingMaskIntoConstraints = false
        image2.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            image1.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image1.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -30),
            image2.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image2.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 30)
        ])
    }
}
