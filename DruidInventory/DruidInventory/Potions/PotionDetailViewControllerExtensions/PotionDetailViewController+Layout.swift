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
        nameTextField.layer.borderColor = UIColor(named: "textColor")?.cgColor
        nameTextField.layer.borderWidth = 1.5
        nameTextField.layer.cornerRadius = 3
        nameTextField.textAlignment = .center
        nameTextField.delegate = self
        nameTextField.textColor = UIColor(named: "textColor")

        let centerYConstraint = nameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor)

        NSLayoutConstraint.activate([
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerYConstraint,
            nameTextField.widthAnchor.constraint(equalToConstant: 200)
        ])

        self.nameTextFieldYConstraint = centerYConstraint
    }

    func configImageLayout() {
        view.addSubview(imageView)
        let tapImage = UITapGestureRecognizer(target: self, action: #selector(imageTapped))

        imageView.image = UIImage(systemName: potion.image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderColor = UIColor(named: "textColor")?.cgColor
        imageView.layer.borderWidth = 1.5
        imageView.layer.cornerRadius = 3
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapImage)

        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.bottomAnchor.constraint(equalTo: nameTextField.topAnchor, constant: -50)
        ])

    }

    func configAmountLayout() {
        view.addSubview(amountTextField)
        amountTextField.text = String(potion.amount)
        amountTextField.translatesAutoresizingMaskIntoConstraints = false
        amountTextField.font = UIFont.systemFont(ofSize: 50)
        amountTextField.layer.borderColor = UIColor(named: "textColor")?.cgColor
        amountTextField.layer.borderWidth = 2
        amountTextField.layer.cornerRadius = 3
        amountTextField.textAlignment = .center
        amountTextField.delegate = self
        amountTextField.keyboardType = .numberPad
        amountTextField.textColor = UIColor(named: "textColor")

        NSLayoutConstraint.activate([
            amountTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            amountTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 50),
            amountTextField.widthAnchor.constraint(equalToConstant: 100),
            amountTextField.heightAnchor.constraint(equalToConstant: 45)
        ])

    }

    func configButtonsLayout(button: UIButton) {
        view.addSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: amountTextField.centerYAnchor),
            button.heightAnchor.constraint(equalTo: amountTextField.heightAnchor)
        ])

        switch button {
        case buttonPlus:
            button.leadingAnchor.constraint(equalTo: amountTextField.trailingAnchor, constant: 20).isActive = true
            button.setImage(ButtonIcons.plusButton, for: .normal)
            button.addTarget(self, action: #selector(addOnTap), for: .touchUpInside)
        case buttonMinus:
            button.trailingAnchor.constraint(equalTo: amountTextField.leadingAnchor, constant: -20).isActive = true
            button.setImage(ButtonIcons.minusButton, for: .normal)
            button.addTarget(self, action: #selector(removeOnTap), for: .touchUpInside)
        default:
            button.titleLabel?.text = "default"
        }

        ButtonIcons.configButtonIcon(button: button)
    }

    func configAddButtonLayout() {
        view.addSubview(buttonAdd)
        buttonAdd.translatesAutoresizingMaskIntoConstraints = false
        buttonAdd.setTitle("ADD", for: .normal)
        buttonAdd.backgroundColor = .systemBlue
        buttonAdd.addTarget(self, action: #selector(addNewOnTap), for: .touchUpInside)

        NSLayoutConstraint.activate([
            buttonAdd.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonAdd.topAnchor.constraint(equalTo: amountTextField.bottomAnchor, constant: 30),
            buttonAdd.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
