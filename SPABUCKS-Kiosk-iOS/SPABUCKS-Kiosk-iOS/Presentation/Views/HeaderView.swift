//
//  HeaderView.swift
//  SPABUCKS-Kiosk-iOS
//
//  Created by Joon Baek on 2023/12/26.
//

import UIKit

class HeaderView: UIView {
    
    // MARK: - UI Properties
    
    let spabucksNameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemPink
        label.text = "SPABUCKS"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .center
        
        return label
    }()
    
    let beverageMenuButton: UIButton = {
        let button = UIButton()
        button.setTitle("음료", for: .normal)
        button.frame.size.width = 100
        button.frame.size.height = 50
        button.layer.cornerRadius = 20
        button.setTitleColor(.black, for: .normal)
        button.layer.shadowColor = UIColor.lightGray.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize.zero
        
        return button
    }()
    
    let foodMenuButton: UIButton = {
        let button = UIButton()
        button.setTitle("푸드", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.frame.size.width = 100
        button.frame.size.height = 50
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.lightGray.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize.zero
        
        return button
    }()
    
    let mdMenuButton: UIButton = {
        let button = UIButton()
        button.setTitle("상품", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.frame.size.width = 100
        button.frame.size.height = 50
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.lightGray.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize.zero
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension HeaderView {
    private func setUI() {
        
        self.backgroundColor = .systemPink
        heightAnchor.constraint(equalToConstant: 65 + 50).isActive = true
        
        let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
            
            return stackView
        }()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        stackView.addArrangedSubview(spabucksNameLabel)
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
        
        return stackView
    }

}
