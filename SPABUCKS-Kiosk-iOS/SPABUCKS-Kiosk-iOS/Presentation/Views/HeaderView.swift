//
//  HeaderView.swift
//  SPABUCKS-Kiosk-iOS
//
//  Created by Joon Baek on 2023/12/26.
//

/**
 상단카테고리 - 유리님
 (주석은 확인 후 지워주세요!)
  **/

import UIKit

class HeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeaderView {
    private func setUI() {
        backgroundColor = .systemRed
        
        heightAnchor.constraint(equalToConstant: 65).isActive = true
    }
}
