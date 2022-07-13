//
//  RecipeDetailMakeButtonCell.swift
//  DruidInventory
//
//  Created by Patrick on 30.06.2022..
//

import UIKit

class RecipeDetailMakeButtonCell: UITableViewCell {

    var makeButton = UIButton()

    var isNewRecipe: Bool = false {
        didSet {
            if !isNewRecipe {
                width = 100
            } else {
                width = 200
            }
            configMakeButtonLayout()
        }
    }

    var isRecipeValid = true {
        didSet {
            configButtonBackground()
        }
    }

    var enoughIngredients = true {
        didSet {
            configButtonBackground()
        }
    }

    var width = 100

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        setupMakeButtonLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RecipeDetailMakeButtonCell {

    func setupMakeButtonLayout() {
        contentView.addSubview(makeButton)
        makeButton.translatesAutoresizingMaskIntoConstraints = false
        makeButton.backgroundColor = .systemBlue
        makeButton.isUserInteractionEnabled = false

        NSLayoutConstraint.activate([
            makeButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            makeButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)

        ])
    }

    func configMakeButtonLayout() {
        if !isNewRecipe {
            makeButton.setTitle("MAKE", for: .normal)
        } else {
            makeButton.setTitle("CREATE RECIPE", for: .normal)
        }

        makeButton.widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
    }

    func setupCell(isNewRecipe: Bool, isRecipeValid: Bool, enoughIngredients: Bool) {
        self.isRecipeValid = isRecipeValid
        self.enoughIngredients = enoughIngredients
        self.isNewRecipe = isNewRecipe
    }

    func configButtonBackground() {
        if !isRecipeValid && isNewRecipe {
            makeButton.backgroundColor = .systemGray
        } else if !isNewRecipe && !enoughIngredients {
            makeButton.backgroundColor = .systemGray
        } else {
            makeButton.backgroundColor = .systemBlue
        }
    }
}
