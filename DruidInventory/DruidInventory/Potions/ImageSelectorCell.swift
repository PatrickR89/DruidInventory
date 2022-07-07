//
//  ImageSelectorCell.swift
//  DruidInventory
//
//  Created by Patrick on 07.07.2022..
//

import UIKit

class ImageSelectorCell: UICollectionViewCell {

    var imageName = ""
    var imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: .zero)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configCellImage(_ inputName: String) {
        imageName = inputName
    }

    func configImageLayout() {

    }

}
