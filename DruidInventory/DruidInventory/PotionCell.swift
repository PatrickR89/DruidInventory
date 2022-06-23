//
//  PotionCell.swift
//  DruidInventory
//
//  Created by Patrick on 23.06.2022..
//

import UIKit

class PotionCell: UITableViewCell {

    var label = UILabel()
    var image = UIImageView()
    var amount = UILabel()

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
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor(white: 0, alpha: 0.5).cgColor
        image.layer.cornerRadius = 1.5

        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            image.widthAnchor.constraint(equalToConstant: 30),
            image.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    func configLabelLayout() {
        contentView.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Potion"

        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20)
        ])
    }

    func configAmountLayout() {
        contentView.addSubview(amount)

        amount.translatesAutoresizingMaskIntoConstraints = false
        amount.text = "Qty: 0"

        NSLayoutConstraint.activate([
            amount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            amount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }

    func setupCell(with potion: Potion) {
        image.image = UIImage(systemName: potion.image)
        label.text = potion.name
        amount.text = "Qty: \(potion.amount)"
    }
}
