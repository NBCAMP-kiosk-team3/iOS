//
//  SpabucksMenuItem.swift
//  SPABUCKS-Kiosk-iOS
//
//  Created by Jason Yang on 12/27/23.
//

import Foundation

class SpabucksMenuItem {
    var id: Int
    var name: String
    var imageName: String
    var price: Double
    
    init(id: Int, name: String, imageName: String, price: Double) {
        self.id = id
        self.name = name
        self.imageName = imageName
        self.price = price
    }
}

extension SpabucksMenuItem {
    func displayInfo() {
        print("\(id)  | W \(name)  | \(price)")
    }
}
