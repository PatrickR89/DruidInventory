//
//  RecipeDetailUploadButtonCell.swift
//  DruidInventory
//
//  Created by Patrick on 22.07.2022..
//

import UIKit

class RecipeDetailUploadButtonCell: UITableViewCell {

    var uploadBtn = UIButton()

    var isRecipeValid = true {
        didSet {
            configButtonBackground()
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = ColorContainer.backgroundColor
        setupMakeButtonLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RecipeDetailUploadButtonCell {

    func setupMakeButtonLayout() {
        contentView.addSubview(uploadBtn)
        uploadBtn.translatesAutoresizingMaskIntoConstraints = false
        uploadBtn.backgroundColor = ColorContainer.standardBlue
        uploadBtn.isUserInteractionEnabled = false
        uploadBtn.setTitle("SEND", for: .normal)

        NSLayoutConstraint.activate([
            uploadBtn.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            uploadBtn.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            uploadBtn.widthAnchor.constraint(equalToConstant: 100)

        ])
    }

    func setupCell(isRecipeValid: Bool) {
        self.isRecipeValid = isRecipeValid
    }

    func configButtonBackground() {
        if !isRecipeValid {
            uploadBtn.backgroundColor = ColorContainer.disabledItem
        } else {
            uploadBtn.backgroundColor = ColorContainer.standardBlue
        }
    }
}
