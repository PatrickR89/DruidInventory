//
//  Dictionary+EquatableValue.swift
//  DruidInventory
//
//  Created by Patrick on 13.07.2022..
//

import UIKit

extension Dictionary where Value: Equatable {
    func keyForValue(value: Value) -> [Key] {
        return compactMap { (key: Key, val: Value) -> Key? in
            value == val ? key : nil
        }
    }
}
