//
//  PotionCell.swift
//  DruidInventory
//
//  Created by Patrick on 23.06.2022..
//

import UIKit

class PotionCell: UITableViewCell {

    lazy var nameLabel = UILabel()
    lazy var image = UIImageView()
    lazy var amountLabel = UILabel()
    var amount = 0 {
        didSet {
            amountLabel.text = "Qty: \(amount)"
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configImageLayout()
        configLabelLayout()
        configAmountLayout()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PotionCell {

    func configImageLayout() {
        contentView.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            image.widthAnchor.constraint(equalToConstant: 30),
            image.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    func configLabelLayout() {
        contentView.addSubview(nameLabel)

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Potion"
        nameLabel.textColor = .black

        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20)
        ])
    }

    func configAmountLayout() {
        contentView.addSubview(amountLabel)

        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.text = "Qty: 0"
        amountLabel.textColor = .black

        NSLayoutConstraint.activate([
            amountLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            amountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }

    func setupCell(with potion: Potion) {
        image.image = UIImage(systemName: potion.image)
        nameLabel.text = potion.name
        amount = potion.amount
        if potion.amount == 0 {
            contentView.backgroundColor = .lightGray
        } else {
            contentView.backgroundColor = .white
        }
    }
}
