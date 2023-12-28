//
//  OrderListView.swift
//  SPABUCKS-Kiosk-iOS
//
//  Created by Joon Baek on 2023/12/26.
//

import UIKit

class OrderListView: UIView {
    
    // MARK: - UI Properties
    
    let countLabel: UILabel = {
        let label = UILabel()
        label.text = "4개"
        
        return label
    }()
    
    let priceTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "총 주문 가격"
        label.textAlignment = .right
        
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "20,000원"
        label.font = UIFont.boldSystemFont(ofSize: 20).withSize(20.0)
        label.textColor = .systemRed
        label.textAlignment = .right
        
        return label
    }()
    
    let cancelButton: ColorButton = {
        let button = ColorButton(title: "취소하기", color: UIColor.systemGray4)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    let paymentButton: ColorButton = {
        let button = ColorButton(title: "결제하기", color: UIColor.red)
        
        return button
    }()
    
    let callEmployeeButton: ColorButton = {
        let margin = 10.0
        let button = ColorButton(title: "직원호출", color: UIColor.systemGray4)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension OrderListView {
    private func setUI() {
        backgroundColor = .systemGray6
        heightAnchor.constraint(equalToConstant: 317 + 45).isActive = true
        
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fill
        verticalStackView.spacing = 0
        
        [createOrderPriceInfo(), createTableView(), createPaymentBtn()].forEach {
            verticalStackView.addArrangedSubview($0)
        }
        
        self.addSubview(verticalStackView)
        
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: self.topAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            verticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30)
        ])
    }
    
    private func createOrderPriceInfo() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        stackView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        [countLabel, priceTitleLabel, priceLabel].forEach {
            stackView.addArrangedSubview($0)
        }
        
        return stackView
    }
    
    private func createPaymentBtn() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        stackView.heightAnchor.constraint(equalToConstant: 65).isActive = true
        
        let cancelButton: ColorButton = {
            let button = ColorButton(title: "취소하기", color: UIColor.systemGray4)
            button.setTitleColor(.black, for: .normal)
            
            return button
        }()
        
        cancelButton.addTarget(cancelButton, action: #selector(cancelButtonTapped), for: .touchUpInside)
        paymentButton.addTarget(paymentButton, action: #selector(paymentButtonTapped), for: .touchUpInside)
        callEmployeeButton.addTarget(callEmployeeButton, action: #selector(paymentButtonTapped), for: .touchUpInside)
        
        [cancelButton, paymentButton, callEmployeeButton].forEach {
            stackView.addArrangedSubview($0)
        }
        
        return stackView
    }
    
    @objc private func cancelButtonTapped() {
        print("취소 버튼이 클릭되었습니다.")
    }

    @objc private func paymentButtonTapped() {
        print("결제 버튼이 클릭되었습니다.")
    }
    
    @objc private func callEmployeeTapped() {
        print("직원호출 버튼이 클릭되었습니다.")
    }
    
    private func createTableView() -> UITableView {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        return tableView
    }
}

extension OrderListView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Row \(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: Cell 선택했을 때
    }
}
