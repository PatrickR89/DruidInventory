//
//  PotionDetailViewController+Delegates.swift
//  DruidInventory
//
//  Created by Patrick on 07.07.2022..
//

import UIKit

extension PotionDetailViewController: UITextFieldDelegate {

    func textFieldDidChangeSelection(_ textField: UITextField) {

        if textField == self.nameTextField {
            guard let nameText = nameTextField.text else {return}
            potion.name = nameText
            if !newPotion {
                PotionContainer.shared.changePotionName(name: nameText, indexPath: indexPath)
            }
        }

        if textField == self.amountTextField {
            guard let amountText = amountTextField.text else {return}
            guard let amount = Int(amountText) else {return}
            potion.amount = amount
            if !newPotion {
                PotionContainer.shared.changePotionAmount(amount: amount, indexPath: indexPath)
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
            PotionContainer.shared.changePotionImage(image: image, indexPath: indexPath)
        }
    }
}
