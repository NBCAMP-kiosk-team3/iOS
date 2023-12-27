//
//  MenuView.swift
//  SPABUCKS-Kiosk-iOS
//
//  Created by Joon Baek on 2023/12/26.
//

/**
 메뉴화면 - 준현님
 (주석은 확인 후 지워주세요!)
  **/

import UIKit

class MenuView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuView {
    private func setUI() {
        backgroundColor = .systemBlue
        heightAnchor.constraint(equalToConstant: 455).isActive = true
    }
}
