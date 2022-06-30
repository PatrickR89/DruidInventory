//
//  RecipeDetailMakeButtonCell.swift
//  DruidInventory
//
//  Created by Patrick on 30.06.2022..
//

import UIKit

class RecipeDetailMakeButtonCell: UITableViewCell {

    var makeButton = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configMakeButtonLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RecipeDetailMakeButtonCell {

    func configMakeButtonLayout() {
        contentView.addSubview(makeButton)
        makeButton.translatesAutoresizingMaskIntoConstraints = false
        makeButton.setTitle("MAKE", for: .normal)
        makeButton.backgroundColor = .systemBlue

        NSLayoutConstraint.activate([
            makeButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            makeButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            makeButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
