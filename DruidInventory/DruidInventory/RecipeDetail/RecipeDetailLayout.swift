//
//  RecipeDetailLayout.swift
//  DruidInventory
//
//  Created by Patrick on 28.06.2022..
//

import UIKit

struct RecipeDetailLayout {
    var amount = UILabel()
    var image = UIImageView()
    var name: String

    init( amount: String, image: String, name: String) {
        self.amount.text = amount
        self.image.image = UIImage(systemName: image)
        self.name = name
    }
}
