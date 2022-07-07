//
//  PotionDetailViewController.swift
//  DruidInventory
//
//  Created by Patrick on 23.06.2022..
//

import UIKit

class PotionDetailViewController: UIViewController {

    var potion: Potion {
        didSet {
            amountTextField.text = String(potion.amount)
            imageView.image = UIImage(systemName: potion.image)

        }
    }

    var indexPath: IndexPath
    var newPotion = false

    lazy var nameTextField = UITextField()
    lazy var imageView = UIImageView()
    lazy var amountTextField = UITextField()
    var buttonPlus = UIButton(type: .custom)
    var buttonMinus = UIButton(type: .custom)
    var buttonAdd = UIButton(type: .custom)

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
        view.backgroundColor = .white
        configTextFieldLayout()
        configImageLayout()
        configAmountLayout()
        configButtonsLayout(button: buttonPlus)
        configButtonsLayout(button: buttonMinus)
        if newPotion {
            configAddButtonLayout()
        }
    }
}

extension PotionDetailViewController {
    @objc func addOnTap() {
        potion.amount += 1
        if !newPotion {
            PotionSingleton.shared.changePotionAmount(amount: potion.amount, indexPath: indexPath)
        }
    }

    @objc func removeOnTap() {
        potion.amount -= 1
        if !newPotion {
            PotionSingleton.shared.changePotionAmount(amount: potion.amount, indexPath: indexPath)
        }
    }

    @objc func imageTapped() {
        let imageSelectorView = ImageSelectorViewController()
        imageSelectorView.delegate = self
        present(imageSelectorView, animated: true)
    }
}

extension PotionDetailViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {

        if textField == self.nameTextField {
            guard let nameText = nameTextField.text else {return}
            potion.name = nameText
            if !newPotion {
                PotionSingleton.shared.changePotionName(name: nameText, indexPath: indexPath)
            }
        }

        if textField == self.amountTextField {
            guard let amountText = amountTextField.text else {return}
            guard let amount = Int(amountText) else {return}
            potion.amount = amount
            if !newPotion {
                PotionSingleton.shared.changePotionAmount(amount: amount, indexPath: indexPath)
            }
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

extension PotionDetailViewController: ImageSelectorDelegate {
    func changeImage(image: String) {
        potion.image = image
        if !newPotion {
            PotionSingleton.shared.changePotionImage(image: image, indexPath: indexPath)
        }
    }
}
