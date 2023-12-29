//
//  SpabucksOrderItem.swift
//  SPABUCKS-Kiosk-iOS
//
//  Created by yen on 12/28/23.
//

import Foundation

struct SpabucksOrderItem {
    var menuItem: SpabucksMenuItem
    var orderCount: Int
    
    init(menuItem: SpabucksMenuItem) {
        self.init(menuItem: menuItem, orderCount: 1)
    }
    
    init(menuItem: SpabucksMenuItem, orderCount: Int) {
        self.menuItem = menuItem
        self.orderCount = orderCount
    }
}
