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
        self.backgroundColor = .systemPink
        heightAnchor.constraint(equalToConstant: 65 + 50).isActive = true
        
        let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
//            stackView.addArrangedSubview(makeCategory())
            return stackView
        }()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        stackView.addArrangedSubview(makeCategory())
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func makeCategory() -> UIStackView {
        self.backgroundColor = .systemGray6
        
        let beverageMenuButton: UIButton = {
            let button = UIButton()
            button.backgroundColor = .white
            button.setTitle("음료", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(tapBeverageButton), for: .touchUpInside)
            return button
        }()
        
        let foodMenuButton: UIButton = {
            let button = UIButton()
            button.setTitle("푸드", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(tapFoodButton), for: .touchUpInside)
            return button
        }()
        
        let mdMenuButton: UIButton = {
            let button = UIButton()
            button.setTitle("상품", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(tapMDButton), for: .touchUpInside)
            return button
        }()

        let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.alignment = .center
            stackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
            return stackView
        }()
        
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(beverageMenuButton)
        stackView.addArrangedSubview(foodMenuButton)
        stackView.addArrangedSubview(mdMenuButton)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        return stackView
    }
    
    @objc private func tapBeverageButton() {
        print("음료 메뉴가 선택되었습니다.")
    }
    
    @objc private func tapFoodButton() {
        print("푸드 메뉴가 선택되었습니다.")
    }
    
    @objc private func tapMDButton() {
        print("상품 메뉴가 선택되었습니다.")
    }
}
