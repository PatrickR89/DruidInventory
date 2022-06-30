//
//  RecipeDetailAddCell.swift
//  DruidInventory
//
//  Created by Patrick on 30.06.2022..
//

import UIKit

class RecipeDetailAddCell: UITableViewCell {

    var imageDisplay = UIImageView()
    var name = ""

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configAddViewLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RecipeDetailAddCell {

    func initializeCell(itemInView: RecipeDetailLayout) {
            imageDisplay.image = UIImage(systemName: itemInView.image)
    }
}
