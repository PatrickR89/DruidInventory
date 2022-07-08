//
//  RecipeComponentSelectorController+Layout.swift
//  DruidInventory
//
//  Created by Patrick on 07.07.2022..
//

import UIKit

extension RecipeComponentSelectorController {

    func configPrevNextButtonLayout(button: UIButton) {
        view.addSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: image.centerYAnchor)
        ])
        button.contentMode = .scaleAspectFill

        switch button {
        case buttonNext:
            button.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20).isActive = true
            button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
            button.addTarget(self, action: #selector(nextOnTap), for: .touchUpInside)
        case buttonPrevious:
            button.trailingAnchor.constraint(equalTo: image.leadingAnchor, constant: -20).isActive = true
            button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
            button.addTarget(self, action: #selector(previousOnTap), for: .touchUpInside)
        default:
            button.titleLabel?.text = "default"
        }
    }

    func configAmountButtonsLayout(button: UIButton) {
        view.addSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: amountTextField.centerYAnchor)
        ])

        switch button {
        case buttonPlus:
            button.leadingAnchor.constraint(equalTo: amountTextField.trailingAnchor, constant: 20).isActive = true
            button.setImage(UIImage(systemName: "plus"), for: .normal)
            button.addTarget(self, action: #selector(addOnTap), for: .touchUpInside)
        case buttonMinus:
            button.trailingAnchor.constraint(equalTo: amountTextField.leadingAnchor, constant: -20).isActive = true
            button.setImage(UIImage(systemName: "minus"), for: .normal)
            button.addTarget(self, action: #selector(removeOnTap), for: .touchUpInside)
        default:
            button.titleLabel?.text = "default"
        }
    }

    func configTextFieldLayout() {
        view.addSubview(nameLabel)
        nameLabel.text = potion.name
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 30)
        nameLabel.textAlignment = .center
        nameLabel.textColor = .black

        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nameLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

    func configImageLayout() {
        view.addSubview(image)

        image.image = UIImage(systemName: potion.image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.borderColor = UIColor.black.cgColor

        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 200),
            image.widthAnchor.constraint(equalToConstant: 200),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -50)
        ])

    }

    func configAmountLayout() {
        view.addSubview(amountTextField)

        amountTextField.text = String(newPotion.amount)
        amountTextField.translatesAutoresizingMaskIntoConstraints = false
        amountTextField.font = UIFont.systemFont(ofSize: 50)
        amountTextField.textAlignment = .center
        amountTextField.textColor = .black
        amountTextField.delegate = self
        amountTextField.keyboardType = .numberPad

        NSLayoutConstraint.activate([
            amountTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            amountTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 50),
            amountTextField.widthAnchor.constraint(equalTo: amountTextField.heightAnchor)
        ])

    }

    func configAddButtonLayout() {
        view.addSubview(buttonAdd)
        buttonAdd.translatesAutoresizingMaskIntoConstraints = false
        buttonAdd.backgroundColor = .systemBlue
        buttonAdd.addTarget(self, action: #selector(addNewOnTap), for: .touchUpInside)

        switch componentType {
        case .inputNew:
            buttonAdd.setTitle("ADD INGREDIENT", for: .normal)
        case .outputNew:
            buttonAdd.setTitle("ADD POTION", for: .normal)
        default:
            print("unknown component type")
        }

        NSLayoutConstraint.activate([
            buttonAdd.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonAdd.topAnchor.constraint(equalTo: amountTextField.bottomAnchor, constant: 30),
            buttonAdd.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}
