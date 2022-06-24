//
//  PotionDetailView.swift
//  DruidInventory
//
//  Created by Patrick on 23.06.2022..
//

import UIKit

class PotionDetailView: UIViewController {

    var potion: Potion
    var indexPath: IndexPath
    var nameTextField = UITextField()
    var image = UIImageView()
    var amountTextField = UITextField()
    var buttonPlus = UIButton(type: .custom)
    var buttonMinus = UIButton(type: .custom)

    required init (potion: Potion, indexPath: IndexPath) {
        self.potion = potion
        self.indexPath = indexPath
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        configTextFieldLayout()
        configImageLayout()
        configAmountLayout()
        configButtonsLayout(button: buttonPlus)
        configButtonsLayout(button: buttonMinus)
    }
}

extension PotionDetailView {
    func configTextFieldLayout() {
        view.addSubview(nameTextField)
        nameTextField.text = potion.name
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.font = UIFont.systemFont(ofSize: 30)
        nameTextField.layer.borderColor = UIColor.white.cgColor
        nameTextField.layer.borderWidth = 1.5
        nameTextField.layer.cornerRadius = 3
        nameTextField.textAlignment = .center

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
        image.layer.borderColor = UIColor.white.cgColor
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
        amountTextField.layer.borderColor = UIColor.white.cgColor
        amountTextField.layer.borderWidth = 1.5
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

        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor

        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalTo: amountTextField.widthAnchor),
            button.heightAnchor.constraint(equalTo: button.widthAnchor),
            button.centerYAnchor.constraint(equalTo: amountTextField.centerYAnchor)
        ])

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
