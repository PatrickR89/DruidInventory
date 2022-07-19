//
//  ImageSelectorViewController.swift
//  DruidInventory
//
//  Created by Patrick on 07.07.2022..
//

import UIKit

class ImageSelectorViewController: UIViewController {

    var images = [String]()
    var usedImages = [String]()

    weak var delegate: ImageSelectorDelegate?

    lazy var collectionLayout: UICollectionViewFlowLayout = {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .vertical
        collectionLayout.itemSize = CGSize(width: view.frame.width / 3.33, height: view.frame.width / 3.33)
        collectionLayout.minimumInteritemSpacing = 0
        collectionLayout.minimumLineSpacing = 0

        return collectionLayout
    }()

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: collectionLayout)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "BACK",
            style: .done,
            target: self,
            action: #selector(dismissOnTap))

        view.backgroundColor = ColorContainer.backgroundColor

        filterUsedImages()
        configCollectionViewLayout()

    }

    func filterUsedImages() {
        for potion in PotionContainer.shared.getAllPotions() {
            usedImages.append(potion.image)
        }

        let homeTabBar = HomeTabBarController()
        images = homeTabBar.potionSymbolNames.filter {!usedImages.contains($0)}
    }

    func configCollectionViewLayout() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        collectionView.register(ImageSelectorCell.self, forCellWithReuseIdentifier: "image")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = ColorContainer.backgroundColor

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])
    }

    @objc func dismissOnTap () {
        dismiss(animated: true)
    }
}

extension ImageSelectorViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "image",
                for: indexPath) as? ImageSelectorCell else {fatalError("No cell!")}
            cell.configCellImage(images[indexPath.row])
            return cell
        }
}

extension ImageSelectorViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.changedImage(image: images[indexPath.item])
        self.dismiss(animated: true)
    }
}
