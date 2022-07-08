//
//  RecipeComponentSelectorController.swift
//  DruidInventory
//
//  Created by Patrick on 07.07.2022..
//

import UIKit

class RecipeComponentSelectorController: UIViewController {

    var potionIndex = 0
    var potion: Potion {
        didSet {
            newPotion.image = potion.image
            newPotion.name = potion.name
        }
    }

    var componentType: RecipeComponentType

    var newPotion = Potion(name: "", image: "", amount: 1) {
        didSet {
            if newPotion.amount <= 1 {
                newPotion.amount = 1
            }
            image.image = UIImage(systemName: newPotion.image)
            nameLabel.text = newPotion.name
            amountTextField.text = String(newPotion.amount)

            switch componentType {

            case .inputChange, .outputChange:
                editComponentOnChange()
            case .inputNew, .outputNew:
                return
            }
        }
    }

    var componentIndexPath: IndexPath
    var componentRecipeIndex = 0

    weak var delegate: RecipeComponentSelectorDelegate?

    lazy var nameLabel = UILabel()
    lazy var image = UIImageView()
    lazy var amountTextField = UITextField()

    lazy var buttonNext = UIButton(type: .custom)
    lazy var buttonPrevious = UIButton(type: .custom)
    lazy var buttonPlus = UIButton(type: .custom)
    lazy var buttonMinus = UIButton(type: .custom)
    lazy var buttonAdd = UIButton(type: .custom)

    required init(componentIndexPath: IndexPath, type: RecipeComponentType, potion: Potion) {
        self.componentIndexPath = componentIndexPath
        self.componentType = type
        self.potion = potion
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
        configPrevNextButtonLayout(button: buttonNext)
        configPrevNextButtonLayout(button: buttonPrevious)
        configAmountButtonsLayout(button: buttonPlus)
        configAmountButtonsLayout(button: buttonMinus)

        switch componentType {
        case .inputNew, .outputNew:
            configAddButtonLayout()
            potion = PotionSingleton.shared.potions[0]
        case .inputChange, .outputChange:
            newPotion.amount = potion.amount
        }

        newPotion.name = potion.name
        newPotion.image = potion.image

        hideKeyboardOnTap()
        enableKeyboardObserver()
    }
}

extension RecipeComponentSelectorController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {

        if textField == self.amountTextField {
            guard let amountText = amountTextField.text else {return}
            guard let tempAmount = Int(amountText) else {return}
            newPotion.amount = tempAmount
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

extension RecipeComponentSelectorController {

    func hideKeyboardOnTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardOnTap))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboardOnTap() {
        view.endEditing(true)
    }

    func enableKeyboardObserver() {

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (
            notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height / 2
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}
