//
//  ButtonIcons.swift
//  DruidInventory
//
//  Created by Patrick on 13.07.2022..
//

import UIKit

struct ButtonIcons {
    static var plusButton: UIImage { UIImage(systemName: "plus")! }
    static var minusButton: UIImage { UIImage(systemName: "minus")! }
    static var nextButton: UIImage { UIImage(systemName: "chevron.right")! }
    static var previousButton: UIImage { UIImage(systemName: "chevron.left")! }

    static func configButtonIcon(button: UIButton) {

        if let btnImageView = button.imageView {
            btnImageView.translatesAutoresizingMaskIntoConstraints = false

            guard let image = btnImageView.image else {return}

            NSLayoutConstraint.activate([
                btnImageView.widthAnchor.constraint(equalToConstant: image.size.width * 2 + 1),
                btnImageView.heightAnchor.constraint(equalToConstant: image.size.height * 2 + 1)
            ])
            print("width \(image.size.width) height \(image.size.height)")
        }
    }
}
