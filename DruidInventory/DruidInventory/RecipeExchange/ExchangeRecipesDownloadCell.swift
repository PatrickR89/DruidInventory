//
//  ExchangeRecipesDownloadCell.swift
//  DruidInventory
//
//  Created by Patrick on 22.07.2022..
//

import UIKit

class ExchangeRecipesDownloadCell: UITableViewCell {

    var downloadBtn = UIButton()

    var isRecipeValid = true {
        didSet {
            configButtonBackground()
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = ColorContainer.backgroundColor
        setupMakeButtonLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ExchangeRecipesDownloadCell {

    func setupMakeButtonLayout() {
        contentView.addSubview(downloadBtn)
        downloadBtn.translatesAutoresizingMaskIntoConstraints = false
        downloadBtn.backgroundColor = ColorContainer.standardBlue
        downloadBtn.isUserInteractionEnabled = false
        downloadBtn.setTitle("DOWNLOAD", for: .normal)


        NSLayoutConstraint.activate([
            downloadBtn.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            downloadBtn.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            downloadBtn.widthAnchor.constraint(equalToConstant: 200)

        ])
    }

    func setupCell(isRecipeValid: Bool) {
        self.isRecipeValid = isRecipeValid
    }

    func configButtonBackground() {
        if !isRecipeValid  {
            downloadBtn.backgroundColor = ColorContainer.disabledItem
        }  else {
            downloadBtn.backgroundColor = ColorContainer.standardBlue
        }
    }
}
