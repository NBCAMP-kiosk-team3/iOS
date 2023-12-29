//
//  OrderListView.swift
//  SPABUCKS-Kiosk-iOS
//
//  Created by Joon Baek on 2023/12/26.
//

import UIKit

class OrderListView: UIView {
    
    // MARK: - Properties
    
    var orderList: [SpabucksOrderItem] = []
    
    // MARK: - UI Properties
    
    private let orderListTable = UITableView()
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.text = "4개"
        
        return label
    }()
    
    private let priceTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "총 주문 가격"
        label.textAlignment = .right
        
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "20,000원"
        label.font = UIFont.boldSystemFont(ofSize: 20).withSize(20.0)
        label.textColor = .systemPink
        label.textAlignment = .right
        
        return label
    }()
    
    private let cancelButton: ColorButton = {
        let button = ColorButton(title: "취소하기", color: UIColor.systemGray4)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    private let paymentButton: ColorButton = {
        let button = ColorButton(title: "결제하기", color: UIColor.systemPink)
        
        return button
    }()
    
    private let callEmployeeButton: ColorButton = {
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
        
        setOrderItem(orderItem)
    }
    
    private func setOrderItem(_ item: SpabucksOrderItem) {
        self.orderList.append(item)
        print(orderList)
        
        updateOrderListTable()
    }
    
    private func updateOrderListTable() {
        let indexPath = IndexPath(row: self.orderList.count-1, section: 0)
        orderListTable.insertRows(at: [indexPath], with: .automatic)
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
        orderListTable.dataSource = self
        orderListTable.delegate = self
        
        orderListTable.backgroundColor = .white
        orderListTable.register(OrderListTableViewCell.self, forCellReuseIdentifier: OrderListTableViewCell.identifier)
        orderListTable.rowHeight = 100.0
        
        return orderListTable
    }
}

extension OrderListView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OrderListTableViewCell.identifier, for: indexPath) as! OrderListTableViewCell
        cell.selectionStyle = .none
        
        cell.itemImageView.image = UIImage(named: orderList[indexPath.row].menuItem.imageName)
        cell.itemNameLabel.text = orderList[indexPath.row].menuItem.name
        cell.itemPriceLabel.text = "\(orderList[indexPath.row].menuItem.price) 원"
        cell.quantityLabel.text = String(orderList[indexPath.row].orderCount)
        
        return cell
    }
}
