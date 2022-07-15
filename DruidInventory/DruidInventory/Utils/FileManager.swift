//
//  FileManager.swift
//  DruidInventory
//
//  Created by Patrick on 13.07.2022..
//

import UIKit

extension FileManager {
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

        return paths[0]
    }

    func getFilePath(_ name: String) -> URL {
        let filePath = getDocumentsDirectory().appendingPathComponent(name)

        return filePath
    }
}
