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
                configMakeButtonLayout(buttonTitle: "MAKE", width: 100)
            } else {
                configMakeButtonLayout(buttonTitle: "ADD RECIPE", width: 200)
            }
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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(named: "backgroundColor")
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

    func configMakeButtonLayout(buttonTitle: String, width: Int) {
        makeButton.setTitle(buttonTitle, for: .normal)
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
