//
//  ViewController.swift
//  SPABUCKS-Kiosk-iOS
//
//  Created by Joon Baek on 2023/12/26.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Properties
    
    private lazy var stackView: UIStackView = { createStackView() }()
    
    private let headerView = HeaderView()
    private let menuView =  MenuView()
    private let orderView =  OrderListView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
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
   
    @objc private func tapCallEmployeeButton() {
        actionAlert(in: self, title: "직원을 호출하였습니다.", message: "잠시만 기다려주세요.", cancelButton: false)
    }
    
    @objc private func tapCancelButton() {
        if orderView.orderList.count != 0 {
            actionAlert(in: self, title: "주문 취소", message: "추가한 메뉴를 모두 삭제하시겠습니까?") {
                self.orderView.orderListRemoveAll()
                actionAlert(in: self, title: "전체 삭제되었습니다.", message: "주문을 다시 진행해주세요", cancelButton: false)
            }
        }
    }
    
    @objc private func tapPaymentButton() {
        if orderView.orderList.count != 0 {
            actionAlert(in: self, title: "결제하기", message: "결제하시겠습니까?") {
                self.orderView.orderListRemoveAll()
                actionAlert(in: self, title: "결제가 완료되었습니다.", message: "", cancelButton: false)
            }
        } else {
            actionAlert(in: self, title: "선택된 상품이 없습니다.", message: "주문할 상품을 선택해주세요.", cancelButton: false)
        }
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
    
    private func setDelegate() {
        menuView.delegate = orderView
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
