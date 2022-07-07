//
//  RecipeComponentSelectorController.swift
//  DruidInventory
//
//  Created by Patrick on 07.07.2022..
//

import UIKit

class RecipeComponentSelectorController: UIViewController {

    var potionIndex = 0
    var potion = PotionSingleton.shared.potions[0] {
        didSet {
            image.image = UIImage(systemName: potion.image)
            nameLabel.text = potion.name
        }
    }

    lazy var nameLabel = UILabel()
    lazy var image = UIImageView()
    lazy var amountTextField = UITextField()
    var amount = 0 {
        didSet {
            amountTextField.text = String(amount)
        }
    }

    lazy var buttonNext = UIButton(type: .custom)
    lazy var buttonPrevious = UIButton(type: .custom)
    lazy var buttonPlus = UIButton(type: .custom)
    lazy var buttonMinus = UIButton(type: .custom)
    lazy var buttonAdd = UIButton(type: .custom)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configTextFieldLayout()
        configImageLayout()
        configAmountLayout()
        configPrevNextButtonLayout(button: buttonNext)
        configPrevNextButtonLayout(button: buttonPrevious)
        configAmountButtonsLayout(button: buttonPlus)
        configAmountButtonsLayout(button: buttonMinus)
        configAddButtonLayout()

    }
}

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

    @objc func nextOnTap() {
        potionIndex += 1
        if potionIndex > PotionSingleton.shared.potions.count - 1 {
            potionIndex = 0
        }
        potion = PotionSingleton.shared.potions[potionIndex]
    }

    @objc func previousOnTap() {
        potionIndex -= 1
        if potionIndex < 0 {
            potionIndex = PotionSingleton.shared.potions.count - 1
        }

        potion = PotionSingleton.shared.potions[potionIndex]
    }

    @objc func addOnTap() {
        amount += 1
    }

    @objc func removeOnTap() {
        amount -= 1
    }

    @objc func addNewOnTap() {

        self.dismiss(animated: true)
    }
}

extension RecipeComponentSelectorController {

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

        amountTextField.text = String(amount)
        amountTextField.translatesAutoresizingMaskIntoConstraints = false
        amountTextField.font = UIFont.systemFont(ofSize: 50)
        amountTextField.textAlignment = .center
        amountTextField.textColor = .black
        amountTextField.delegate = self

        NSLayoutConstraint.activate([
            amountTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            amountTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 50),
            amountTextField.widthAnchor.constraint(equalTo: amountTextField.heightAnchor)
        ])

    }

    func configAddButtonLayout() {
        view.addSubview(buttonAdd)
        buttonAdd.translatesAutoresizingMaskIntoConstraints = false
        buttonAdd.setTitle("ADD INGREDIENT", for: .normal)
        buttonAdd.backgroundColor = .systemBlue
        buttonAdd.addTarget(self, action: #selector(addNewOnTap), for: .touchUpInside)

        NSLayoutConstraint.activate([
            buttonAdd.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonAdd.topAnchor.constraint(equalTo: amountTextField.bottomAnchor, constant: 30),
            buttonAdd.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}

extension RecipeComponentSelectorController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {

        if textField == self.amountTextField {
            guard let amountText = amountTextField.text else {return}
            guard let tempAmount = Int(amountText) else {return}
            amount = tempAmount
        }
    }

    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String) -> Bool {
        if textField == self.amountTextField {
            guard let currentAmount = amountTextField.text else {return false}
            guard let stringRange = Range(range, in: currentAmount) else {return false}
            let updatedString = currentAmount.replacingCharacters(in: stringRange, with: string)

            return (
                updatedString.count <= 2 &&
                string.rangeOfCharacter(from: NSCharacterSet.decimalDigits.inverted) == nil)
        }
        return true
    }
}
