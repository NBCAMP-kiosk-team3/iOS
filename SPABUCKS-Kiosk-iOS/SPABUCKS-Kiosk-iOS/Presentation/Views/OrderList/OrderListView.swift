//
//  OrderListView.swift
//  SPABUCKS-Kiosk-iOS
//
//  Created by Joon Baek on 2023/12/26.
//

import UIKit

class OrderListView: UIView {
    
    // MARK: - Properties
    
    var tempOrderList: [SpabucksOrderItem] = [
        SpabucksOrderItem(menuItem: SpabucksMenuItem(id: 0, name: "Caffè Americano", imageName: "americano", price: 5.7)),
        SpabucksOrderItem(menuItem: SpabucksMenuItem(id: 1, name: "Caramel Macchiato", imageName: "caramel_macchiato", price: 5.9), orderCount: 3)
    ]
    
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
        label.textColor = .systemPink
        label.textAlignment = .right
        
        return label
    }()
    
    let cancelButton: ColorButton = {
        let button = ColorButton(title: "취소하기", color: UIColor.systemGray4)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    let paymentButton: ColorButton = {
        let button = ColorButton(title: "결제하기", color: UIColor.systemPink)
        
        return button
    }()
    
    let callEmployeeButton: ColorButton = {
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
    
    func getOrderItem(_ item: SpabucksMenuItem) {
        let orderItem = SpabucksOrderItem(menuItem: item)
        tempOrderList.append(orderItem)
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
        
        [callEmployeeButton, cancelButton, paymentButton].forEach {
            stackView.addArrangedSubview($0)
        }
        
        return stackView
    }
    
    private func createTableView() -> UITableView {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(OrderListTableViewCell.self, forCellReuseIdentifier: OrderListTableViewCell.identifier)
        tableView.rowHeight = 100.0
        
        return tableView
    }
}

extension OrderListView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempOrderList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OrderListTableViewCell.identifier, for: indexPath) as! OrderListTableViewCell
        cell.selectionStyle = .none
        
        cell.itemImageView.image = UIImage(named: tempOrderList[indexPath.row].menuItem.imageName)
        cell.itemNameLabel.text = tempOrderList[indexPath.row].menuItem.name
        cell.itemPriceLabel.text = "\(tempOrderList[indexPath.row].menuItem.price) 원"
        cell.quantityLabel.text = String(tempOrderList[indexPath.row].orderCount)
        
        return cell
    }
}
