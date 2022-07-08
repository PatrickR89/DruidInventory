//
//  RecipeDetailMakeButtonCell.swift
//  DruidInventory
//
//  Created by Patrick on 30.06.2022..
//

import UIKit

class RecipeDetailMakeButtonCell: UITableViewCell {

    var makeButton = UIButton()

    var isNewRecipe = false {
        didSet {
            if !isNewRecipe {
                width = 100
            } else {
                width = 200
            }
            configMakeButtonLayout()
        }
    }
    var width = 100

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RecipeDetailMakeButtonCell {

    func configMakeButtonLayout() {
        contentView.addSubview(makeButton)
        makeButton.translatesAutoresizingMaskIntoConstraints = false
        makeButton.backgroundColor = .systemBlue
        makeButton.isUserInteractionEnabled = false

        if !isNewRecipe {
            makeButton.setTitle("MAKE", for: .normal)
        } else {
            makeButton.setTitle("CREATE RECIPE", for: .normal)
        }

        NSLayoutConstraint.activate([
            makeButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            makeButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            makeButton.widthAnchor.constraint(equalToConstant: CGFloat(width))
        ])
    }

    func setupCell(isNewRecipe: Bool) {
        self.isNewRecipe = isNewRecipe
    }
}

