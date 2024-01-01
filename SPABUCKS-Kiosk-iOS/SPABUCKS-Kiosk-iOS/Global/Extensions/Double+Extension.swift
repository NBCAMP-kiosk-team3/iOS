//
//  Double+Extension.swift
//  SPABUCKS-Kiosk-iOS
//
//  Created by t2023-m0035 on 12/29/23.
//

import Foundation

extension Double {
    func formattedString() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 0

        if let formattedString = numberFormatter.string(from: NSNumber(value: self)) {
            return formattedString
        } else {
            return "\(self)"  
        }
    }
}
