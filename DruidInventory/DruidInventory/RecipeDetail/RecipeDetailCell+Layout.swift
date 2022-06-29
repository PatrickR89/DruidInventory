//
//  RecipeDetailCell+Layout.swift
//  DruidInventory
//
//  Created by Patrick on 28.06.2022..
//

import UIKit

extension RecipeDetailCell {
    
    func configItemViewLayout() {
        contentView.addSubview(amount)
        amount.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(image1)
        image1.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            amount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            amount.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -15),
            image1.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image1.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 15)
        ])
    }
    
    func configAddViewLayout() {
        contentView.addSubview(image1)
        image1.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            image1.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image1.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    func configResultsInView() {
        contentView.addSubview(image1)
        contentView.addSubview(image2)
        
        image1.translatesAutoresizingMaskIntoConstraints = false
        image2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            image1.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image1.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -30),
            image2.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image2.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 30)
        ])
    }
}
