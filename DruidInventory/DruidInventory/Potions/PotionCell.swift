//
//  PotionCell.swift
//  DruidInventory
//
//  Created by Patrick on 23.06.2022..
//

import UIKit

class PotionCell: UITableViewCell {

    lazy var nameLabel = UILabel()
    lazy var cellImageView = UIImageView()
    lazy var amountLabel = UILabel()
    var amount = 0 {
        didSet {
            amountLabel.text = "Qty: \(amount)"
            if amount <= 0 {
                cellImageView.tintColor = .red
            } else {
                cellImageView.tintColor = .systemBlue
            }
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
        contentView.addSubview(cellImageView)
        cellImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            cellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            cellImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cellImageView.widthAnchor.constraint(equalToConstant: 30),
            cellImageView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    func configLabelLayout() {
        contentView.addSubview(nameLabel)

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Potion"
        nameLabel.textColor = UIColor(named: "textColor")

        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 20)
        ])
    }

    func configAmountLayout() {
        contentView.addSubview(amountLabel)

        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.text = "Qty: 0"
        amountLabel.textColor = UIColor(named: "textColor")

        NSLayoutConstraint.activate([
            amountLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            amountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }

    func setupCell(with potion: Potion) {
        cellImageView.image = UIImage(systemName: potion.image)
        nameLabel.text = potion.name
        amount = potion.amount
        if potion.amount == 0 {
            contentView.backgroundColor = UIColor(named: "disabled")
        } else {
            contentView.backgroundColor = UIColor(named: "backgroundColor")
        }
    }
}
