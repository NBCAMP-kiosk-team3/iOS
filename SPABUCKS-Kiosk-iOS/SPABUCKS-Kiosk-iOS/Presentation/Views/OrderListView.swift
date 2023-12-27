//
//  OrderListView.swift
//  SPABUCKS-Kiosk-iOS
//
//  Created by Joon Baek on 2023/12/26.
//

import UIKit

class OrderListView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OrderListView {
    private func setUI() {
        backgroundColor = .systemGray6
        heightAnchor.constraint(equalToConstant: 317 + 45).isActive = true
        
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fill
        verticalStackView.spacing = 0
        
        verticalStackView.addArrangedSubview(createOrderPriceInfo())
        verticalStackView.addArrangedSubview(createTableView())
        verticalStackView.addArrangedSubview(createPaymentBtn())
        
        self.addSubview(verticalStackView)

        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: self.topAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30)
        ])
    }
    
    private func createOrderPriceInfo() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        stackView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        let countLabel = UILabel()
        countLabel.text = "0개"
        
        let priceTitleLabel = UILabel()
        priceTitleLabel.text = "총 주문 가격"
        
        let priceLabel = UILabel()
        priceLabel.text = "0원"
        priceLabel.font = UIFont.boldSystemFont(ofSize: 20).withSize(20.0)
        priceLabel.textColor = .systemRed
        
        stackView.addArrangedSubview(countLabel)
        stackView.addArrangedSubview(priceTitleLabel)
        stackView.addArrangedSubview(priceLabel)
        
        return stackView
    }
    
    private func createPaymentBtn() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .trailing
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        stackView.heightAnchor.constraint(equalToConstant: 65).isActive = true
        
        let cancelBtn: ColorButton = {
            let button = ColorButton(title: "취소하기", color: UIColor.systemGray4)
            button.setTitleColor(.black, for: .normal)
            
            return button
        }()
        
        let paymentBtn: ColorButton = {
            var button = ColorButton(title: "결제하기", color: UIColor.red)
            
            return button
        }()
        
        stackView.addArrangedSubview(UILabel())
        stackView.addArrangedSubview(cancelBtn)
        stackView.addArrangedSubview(paymentBtn)
        
        return stackView
    }
    
    private func createTableView() -> UITableView {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        return tableView
    }
}

extension OrderListView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
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
