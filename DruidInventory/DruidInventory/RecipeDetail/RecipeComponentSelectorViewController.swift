//
//  RecipeComponentSelectorController.swift
//  DruidInventory
//
//  Created by Patrick on 07.07.2022..
//

import UIKit

class RecipeComponentSelectorViewController: UIViewController {

    var potionIndex = 0
    var potion: Potion {
        didSet {
            newPotion.image = potion.image
            newPotion.name = potion.name
            newPotion.id = potion.id
        }
    }
    var filteredComponents: [Potion]
    var componentType: RecipeComponentType

    var nameLabelYConstraint: NSLayoutConstraint?

    var newPotion = Potion(name: "", image: "", amount: 1, id: UUID()) {
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

    var buttonTitle = "DONE"

    required init(
        componentIndexPath: IndexPath,
        type: RecipeComponentType,
        potion: Potion,
        filteredComponents: [Potion]) {
            self.componentIndexPath = componentIndexPath
            self.componentType = type
            self.potion = potion
            self.filteredComponents = filteredComponents
            super.init(nibName: nil, bundle: nil)
        }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: buttonTitle,
            style: .done,
            target: self,
            action: #selector(dismissOnTap))

        view.backgroundColor = ColorContainer.backgroundColor
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
            potion = filteredComponents[0]
        case .inputChange, .outputChange:
            newPotion.amount = potion.amount
        }

        newPotion.name = potion.name
        newPotion.image = potion.image
        newPotion.id = potion.id

        hideKeyboardOnTap()
        enableKeyboardObserver()
    }

    @objc func dismissOnTap () {
        dismiss(animated: true)
    }
}

extension RecipeComponentSelectorViewController: UITextFieldDelegate {
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
