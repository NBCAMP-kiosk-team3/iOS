//
//  HeaderView.swift
//  SPABUCKS-Kiosk-iOS
//
//  Created by Joon Baek on 2023/12/26.
//

import UIKit

protocol HeaderViewDelegate: AnyObject {
    func didTapBeverageButton()
    func didTapFoodButton()
    func didTapMDButton()
}

// MARK: - HeaderView

final class HeaderView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: HeaderViewDelegate?
    
    // MARK: - UI Properties
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let spabucksNameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemPink
        label.text = "SPABUCKS"
        label.font = UIFont(name: "BlackHanSans-Regular", size: 30)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var beverageMenuButton: UIButton = { createTabButton(with: "음료")}()
    
    private lazy var foodMenuButton: UIButton = { createTabButton(with: "푸드")}()
    
    private lazy var mdMenuButton: UIButton = { createTabButton(with: "상품")}()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
        setupButtonTargets()
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
        
        stackView.addArrangedSubview(spabucksNameLabel)
        stackView.addArrangedSubview(makeCategory())
    }
    
    private func setLayout() {
        self.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func setupButtonTargets() {
        beverageMenuButton.addTarget(self, action: #selector(didTapBeverageButton), for: .touchUpInside)
        foodMenuButton.addTarget(self, action: #selector(didTapFoodButton), for: .touchUpInside)
        mdMenuButton.addTarget(self, action: #selector(didTapMdButton), for: .touchUpInside)
    }
    
    private func makeCategory() -> UIStackView {
        self.backgroundColor = .systemGray6
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        stackView.addArrangedSubview(beverageMenuButton)
        stackView.addArrangedSubview(foodMenuButton)
        stackView.addArrangedSubview(mdMenuButton)
        
        return stackView
    }
    
    private func createTabButton(with title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.frame.size.width = 100
        button.frame.size.height = 50
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.lightGray.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize.zero
        
        return button
    }
    
    // MARK: - Action Helpers
    
    @objc func didTapBeverageButton() {
        delegate?.didTapBeverageButton()
        
    }
    
    @objc func didTapFoodButton() {
        delegate?.didTapFoodButton()
        
    }
    
    @objc func didTapMdButton() {
        delegate?.didTapMDButton()
        
    }
    
    func highlightBeverageButton() {
        mdMenuButton.backgroundColor = .clear
        foodMenuButton.backgroundColor = .clear
        beverageMenuButton.backgroundColor = .white
    }
    
    func highlightFoodButton() {
        mdMenuButton.backgroundColor = .clear
        beverageMenuButton.backgroundColor = .clear
        foodMenuButton.backgroundColor = .white
    }
    
    func highlightMdButton() {
        beverageMenuButton.backgroundColor = .clear
        foodMenuButton.backgroundColor = .clear
        mdMenuButton.backgroundColor = .white
    }
}
