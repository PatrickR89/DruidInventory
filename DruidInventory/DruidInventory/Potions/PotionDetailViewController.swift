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

    var buttonTitle = "DONE"

    var newPotion = false

    var nameTextFieldYConstraint: NSLayoutConstraint?

    lazy var nameTextField = UITextField()
    lazy var imageView = UIImageView()
    lazy var amountTextField = UITextField()

    lazy var buttonPlus = UIButton(type: .custom)
    lazy var buttonMinus = UIButton(type: .custom)
    lazy var buttonAdd = UIButton(type: .custom)

    required init (potion: Potion) {
        self.potion = potion
        if potion.name == "" {
            buttonTitle = "BACK"
        }
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
        self.configTextFieldLayout()
        configImageLayout()
        configAmountLayout()
        configButtonsLayout(button: buttonPlus)
        configButtonsLayout(button: buttonMinus)
        if newPotion {
            configAddButtonLayout()
        }
        enableKeyboardObserver()
        hideKeyboardOnTap()

    }

    @objc func dismissOnTap () {
        dismiss(animated: true)
    }
}
