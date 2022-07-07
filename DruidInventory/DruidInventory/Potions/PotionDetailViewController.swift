//
//  PotionDetailViewController.swift
//  DruidInventory
//
//  Created by Patrick on 23.06.2022..
//

import UIKit

class PotionDetailViewController: UIViewController {

    var potion: Potion
    var indexPath: IndexPath
    lazy var nameTextField = UITextField()
    lazy var image = UIImageView()
    lazy var amountTextField = UITextField()
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
        view.backgroundColor = .white
        configTextFieldLayout()
        configImageLayout()
        configAmountLayout()
        configButtonsLayout(button: buttonPlus)
        configButtonsLayout(button: buttonMinus)
    }
}

extension PotionDetailViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let nameText = nameTextField.text else {return}
        potion.name = nameText
        PotionSingleton.shared.changePotionName(name: nameText, indexPath: indexPath)
    }
}
