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

    lazy var buttonPlus = UIButton(type: .custom)
    lazy var buttonMinus = UIButton(type: .custom)
    lazy var buttonAdd = UIButton(type: .custom)

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
        enableKeyboardObserver()
        hideKeyboardOnTap()
    }
}
