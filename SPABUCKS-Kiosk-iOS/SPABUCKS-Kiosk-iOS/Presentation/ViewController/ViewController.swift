//
//  ViewController.swift
//  SPABUCKS-Kiosk-iOS
//
//  Created by Joon Baek on 2023/12/26.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Properties
    
    private lazy var stackView: UIStackView = { createStackView() }()
    
    private let headerView = HeaderView()
    private let menuView =  MenuView()
    private let orderView =  OrderListView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.beverageMenuButton.addTarget(self, action: #selector(tapBeverageButton), for: .touchUpInside)
        headerView.foodMenuButton.addTarget(self, action: #selector(tapFoodButton), for: .touchUpInside)
        headerView.mdMenuButton.addTarget(self, action: #selector(tapMDButton), for: .touchUpInside)
    
        setUI()
        setLayout()
    }
}

// MARK: - Extensions

extension ViewController {
    @objc private func tapBeverageButton() {
        headerView.mdMenuButton.backgroundColor = .clear
        headerView.foodMenuButton.backgroundColor = .clear
        headerView.beverageMenuButton.backgroundColor = .white
        menuView.showBeverageView()
    }
    
    @objc private func tapFoodButton() {
        headerView.mdMenuButton.backgroundColor = .clear
        headerView.beverageMenuButton.backgroundColor = .clear
        headerView.foodMenuButton.backgroundColor = .white
        menuView.showFoodMenuView()
    }
    
    @objc private func tapMDButton() {
        headerView.beverageMenuButton.backgroundColor = .clear
        headerView.foodMenuButton.backgroundColor = .clear
        headerView.mdMenuButton.backgroundColor = .white
        menuView.showMdMenuView()
    }
    
    private func setUI() {
        view.backgroundColor = .white
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        headerView.translatesAutoresizingMaskIntoConstraints = false
        menuView.translatesAutoresizingMaskIntoConstraints = false
        orderView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setLayout() {
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func createStackView() -> UIStackView {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        
        [headerView, menuView, orderView].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }
}
