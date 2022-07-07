//
//  ImageSelectorViewController.swift
//  DruidInventory
//
//  Created by Patrick on 07.07.2022..
//

import UIKit

class ImageSelectorViewController: UIViewController {

    var images = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        initializeImages()
    }

    func initializeImages() {
        let homeTabBar = HomeTabBarController()
        images = homeTabBar.potionSymbolNames
    }
}

extension ImageSelectorViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "image",
                for: indexPath) as? ImageSelectorCell else {fatalError("No cell!")}

            return cell
        }
}

extension ImageSelectorViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}
