//
//  Eatable.swift
//  SPABUCKS-Kiosk-iOS
//
//  Created by Jason Yang on 12/28/23.
//

import Foundation

protocol Eatable {
    var id: Int { get set }
    var name: String { get set }
    var imageName: String { get set }
    var price: Double { get set }
    
    func displayInfo()
}

extension Eatable {
    func displayInfo() {
        print("\(id)  | W \(name)  | \(price)")
    }
}
