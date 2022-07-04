//
//  RecipeContentView.swift
//  DruidInventory
//
//  Created by Patrick on 01.07.2022..
//

import UIKit

class RecipeContentView: UIView {
    var imageView = UIImageView()

    required init (image: String) {
        self.imageView.image = UIImage(systemName: image)
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configImageViewLayout() {
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.widthAnchor.constraint(equalToConstant: 25),
            self.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}
