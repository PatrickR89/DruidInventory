//
//  PotionDelegate.swift
//  DruidInventory
//
//  Created by Patrick on 07.07.2022..
//

import UIKit

protocol PotionDelegate: AnyObject {
    func changeName(name: String, indexPath: IndexPath)
    func changeAmount(amount: Int, indexPath: IndexPath)
    func changeImage(image: String, indexPath: IndexPath)
}
