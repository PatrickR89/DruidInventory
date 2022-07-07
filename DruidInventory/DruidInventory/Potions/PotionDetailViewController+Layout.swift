//
//  PotionDetailViewController+Layout.swift
//  DruidInventory
//
//  Created by Patrick on 07.07.2022..
//

import UIKit

extension PotionDetailViewController {
    func configTextFieldLayout() {
        view.addSubview(nameTextField)
        nameTextField.text = potion.name
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.font = UIFont.systemFont(ofSize: 30)
        nameTextField.layer.borderColor = UIColor.black.cgColor
        nameTextField.layer.borderWidth = 1.5
        nameTextField.layer.cornerRadius = 3
        nameTextField.textAlignment = .center
        nameTextField.delegate = self

        NSLayoutConstraint.activate([
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nameTextField.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

    func configImageLayout() {
        view.addSubview(image)
        image.image = UIImage(systemName: potion.image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.borderWidth = 1.5
        image.layer.cornerRadius = 3

        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 200),
            image.widthAnchor.constraint(equalToConstant: 200),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.bottomAnchor.constraint(equalTo: nameTextField.topAnchor, constant: -50)
        ])

    }

    func configAmountLayout() {
        view.addSubview(amountTextField)
        amountTextField.text = String(potion.amount)
        amountTextField.translatesAutoresizingMaskIntoConstraints = false
        amountTextField.font = UIFont.systemFont(ofSize: 50)
        amountTextField.layer.borderColor = UIColor.black.cgColor
        amountTextField.layer.borderWidth = 2
        amountTextField.layer.cornerRadius = 3
        amountTextField.textAlignment = .center

        NSLayoutConstraint.activate([
            amountTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            amountTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 50),
            amountTextField.widthAnchor.constraint(equalTo: amountTextField.heightAnchor)
        ])

    }

    func configButtonsLayout(button: UIButton) {
        view.addSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalTo: amountTextField.widthAnchor),
            button.heightAnchor.constraint(equalTo: button.widthAnchor),
            button.centerYAnchor.constraint(equalTo: amountTextField.centerYAnchor)
        ])
        button.contentMode = .scaleAspectFill

        switch button {
        case buttonPlus:
            button.leadingAnchor.constraint(equalTo: amountTextField.trailingAnchor, constant: 20).isActive = true
            button.setImage(UIImage(systemName: "plus"), for: .normal)
        case buttonMinus:
            button.trailingAnchor.constraint(equalTo: amountTextField.leadingAnchor, constant: -20).isActive = true
            button.setImage(UIImage(systemName: "minus"), for: .normal)
        default:
            button.titleLabel?.text = "default"
        }
    }
}
