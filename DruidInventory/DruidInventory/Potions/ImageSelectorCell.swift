//
//  ImageSelectorCell.swift
//  DruidInventory
//
//  Created by Patrick on 07.07.2022..
//

import UIKit

class ImageSelectorCell: UICollectionViewCell {

    var imageName = "" {
        didSet {
            configImageLayout()
        }
    }

    lazy var imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configCellImage(_ inputName: String) {
        imageName = inputName
    }

    func configImageLayout() {
        contentView.addSubview(imageView)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: imageName)

        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: contentView.frame.width),
            imageView.heightAnchor.constraint(equalToConstant: contentView.frame.height)
        ])
    }

}
