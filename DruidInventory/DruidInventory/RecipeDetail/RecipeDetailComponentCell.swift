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
    var name = ""

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configItemViewLayout()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RecipeDetailComponentCell {

    func initializeCell(name: String, image: String, count: Int) {
            amount.text = "\(count)x"
        imageDisplay.image = UIImage(systemName: image)
    }
}
