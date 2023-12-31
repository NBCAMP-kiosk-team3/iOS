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
    
        setUI()
        setLayout()
        setupButtonTargets()
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
    
    func alertAction(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "네", style: .default)
        let cancel = UIAlertAction(title: "아니오", style: .destructive)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    @objc private func tapCallEmployeeButton() {
        alertAction(title: "직원 호출", message: "직원 도움이 필요하신가요?")
    }
    
    @objc private func tapCancelButton() {
        alertAction(title: "전체 삭제", message: "추가한 메뉴를 모두 삭제하시겠습니까?")
    }
    
    @objc private func tapPaymentButton() {
        alertAction(title: "결제하기", message: "결제하시겠습니까?")
    }
    
    private func setUI() {
        view.backgroundColor = .white
        
        headerView.beverageMenuButton.backgroundColor = .white
        menuView.showBeverageView()
        
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
    
    private func setupButtonTargets() {
        headerView.beverageMenuButton.addTarget(self, action: #selector(tapBeverageButton), for: .touchUpInside)
        headerView.foodMenuButton.addTarget(self, action: #selector(tapFoodButton), for: .touchUpInside)
        headerView.mdMenuButton.addTarget(self, action: #selector(tapMDButton), for: .touchUpInside)
        orderView.callEmployeeButton.addTarget(self, action: #selector(tapCallEmployeeButton), for: .touchUpInside)
        orderView.cancelButton.addTarget(self, action: #selector(tapCancelButton), for: .touchUpInside)
        orderView.paymentButton.addTarget(self, action: #selector(tapPaymentButton), for: .touchUpInside)
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
