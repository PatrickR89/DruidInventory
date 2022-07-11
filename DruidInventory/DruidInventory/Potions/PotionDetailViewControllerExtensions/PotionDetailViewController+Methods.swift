//
//  PotionDetailViewController+Methods.swift
//  DruidInventory
//
//  Created by Patrick on 07.07.2022..
//

import UIKit

extension PotionDetailViewController {

    @objc func addNewOnTap() {
        if newPotion {
            PotionContainer.shared.addNewPotion(potion: potion)
        }
        self.dismiss(animated: true)
    }

    @objc func addOnTap() {
        potion.amount += 1
        if !newPotion {
            PotionContainer.shared.changePotionAmount(amount: potion.amount, indexPath: indexPath)
        }
    }

    @objc func removeOnTap() {
        potion.amount -= 1
        if !newPotion {
            PotionContainer.shared.changePotionAmount(amount: potion.amount, indexPath: indexPath)
        }
    }

    @objc func imageTapped() {
        let imageSelectorView = ImageSelectorViewController()
        imageSelectorView.delegate = self
        present(imageSelectorView, animated: true)
    }
}
