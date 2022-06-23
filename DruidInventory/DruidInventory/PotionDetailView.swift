//
//  PotionDetailView.swift
//  DruidInventory
//
//  Created by Patrick on 23.06.2022..
//

import UIKit

class PotionDetailView: UIViewController {

    var potion: Potion
    var indexPath: IndexPath
    var label = UITextField()

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
        view.backgroundColor = .cyan
        view.addSubview(label)
        label.text = potion.name
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30)
        label.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20).isActive = true
    }
}
