//
//  OrderListView.swift
//  SPABUCKS-Kiosk-iOS
//
//  Created by Joon Baek on 2023/12/26.
//

/**
 주문내역 - 예은님
 (주석은 확인 후 지워주세요!)
  **/

import UIKit

class OrderListView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OrderListView {
    private func setUI() {
        backgroundColor = .systemYellow
        
        heightAnchor.constraint(equalToConstant: 317 + 45).isActive = true
    }
}
