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
        setUI()
        setLayout()
    }
}

// MARK: - Extensions

extension ViewController {
    @objc private func tapBeverageButton() {
        print("음료 메뉴가 선택되었습니다.")
        // HeaderView에서 2. 다른방법 : vc. 매서드 호출 -> delegate로 구현 delegate.매서드 / protocol로 delegate를 구현
        // 헤더뷰가 아닌 delegate(위임자)가 대신 실행
        // 탭 했을 때, 메뉴뷰에게 음료를 보여줘
        menuView.showBeverageView()
        
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
