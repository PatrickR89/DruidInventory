//
//  RecipeLayout.swift
//  DruidInventory
//
//  Created by Patrick on 27.06.2022..
//

import UIKit

struct RecipeLayout {
    var amount = UILabel()
    var image = UIImageView()

    init( amount: String, image: String) {
        self.amount.text = amount
        self.image.image = UIImage(systemName: image)
    }
}
