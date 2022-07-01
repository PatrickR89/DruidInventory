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
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RecipeDetailResultsInCell {

    func initializeCell() {
        image1Display.image = UIImage(systemName: "arrow.down")
        image2Display.image = UIImage(systemName: "arrow.down")
    }
}
