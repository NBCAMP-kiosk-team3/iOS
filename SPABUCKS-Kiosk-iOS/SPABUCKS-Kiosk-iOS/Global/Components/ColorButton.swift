//
//  ColorButton.swift
//  SPABUCKS-Kiosk-iOS
//
//  Created by Joon Baek on 2023/12/26.
//

import UIKit

final class ColorButton: UIButton {
    
    var tapHandler: (() -> Void)?
    
    init(title: String, color: UIColor) {
        super.init(frame: .zero)
        
        setupUI(title: title, color: color)
        
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonTapped() {
        tapHandler?()
    }
}

extension ColorButton {
    private func setupUI(title: String, color: UIColor) {
        setTitle(title, for: .normal)
        backgroundColor = color
        layer.cornerRadius = 5
        widthAnchor.constraint(equalToConstant: 70).isActive = true
    }
}
