//
//  OrderListView.swift
//  SPABUCKS-Kiosk-iOS
//
//  Created by Joon Baek on 2023/12/26.
//

import UIKit

class OrderListView: UIView, MenuDataDelegate {
    
    // MARK: - Properties
    
    var orderList: [SpabucksOrderItem] = [] 
    
    // MARK: - UI Properties
    
    private let orderListTable = UITableView()
    
    private let countLabel = UILabel()
    
    private let priceTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "총 주문 가격"
        label.textAlignment = .right
        
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
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
    
    // MARK: MenuDataDelegate setting
    
    func didSelectMenuItem(_ item: SpabucksMenuItem) {
        setOrderItem(item)
        updateOrderListTable()
    }
    
    private func setOrderItem(_ item: SpabucksMenuItem) {
        let orderItemData = SpabucksOrderItem(menuItem: item)
        orderList.append(orderItemData)
    }
    
    private func updateOrderListTable() {
        let indexPath = IndexPath(row: self.orderList.count-1, section: 0)
        orderListTable.insertRows(at: [indexPath], with: .automatic)
        
        setTotalOrderInfo()
    }
    
}

// MARK: - Extensions

extension OrderListView {
    private func setUI() {
        backgroundColor = .systemGray6
        heightAnchor.constraint(equalToConstant: 317 + 45).isActive = true
        
        setTotalOrderInfo()
        
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
    func setTotalOrderInfo() {
        let orderListCount = orderList.count
        var totalPrice: Double = 0
        var totalCount: Int = 0
        
        for i in 0 ..< orderListCount {
            totalPrice += orderList[i].menuItem.price * Double(orderList[i].orderCount)
            totalCount += orderList[i].orderCount
        }
        
        countLabel.text = "\(totalCount) 개"
        priceLabel.text = "\(totalPrice.formattedString())원"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OrderListTableViewCell.identifier, for: indexPath) as! OrderListTableViewCell
        cell.selectionStyle = .none
        
        cell.onMinusButton = { [weak self] in
            self?.updateOrderCount(at: indexPath, delta: -1)
        }
        
        cell.onPlusButton = { [weak self] in
            self?.updateOrderCount(at: indexPath, delta: 1)
        }
        
        cell.onDeleteButton = { [weak self] in
            self?.deleteOrder(at: indexPath)
        }
        
        cell.itemImageView.image = UIImage(named: orderList[indexPath.row].menuItem.imageName)
        cell.itemNameLabel.text = orderList[indexPath.row].menuItem.name
        cell.itemPriceLabel.text = "\((self.orderList[indexPath.row].menuItem.price * Double(self.orderList[indexPath.row].orderCount)).formattedString()) 원"
        cell.quantityLabel.text = String(self.orderList[indexPath.row].orderCount)
        
        return cell
    }
    
    private func updateOrderCount(at indexPath: IndexPath, delta: Int) {
        var customIndexPath = IndexPath()
        
        if indexPath.row < orderList.count {
            customIndexPath = indexPath
        } else {
            customIndexPath = IndexPath(row: self.orderList.count-1, section: 0)
        }
        
        var orderItem = orderList[customIndexPath.row]
        orderItem.orderCount += delta
        
        if orderItem.orderCount > 0 {
            orderList[customIndexPath.row] = orderItem
            
            setTotalOrderInfo()
            orderListTable.reloadRows(at: [customIndexPath], with: .none)
        }
    }
    
    private func deleteOrder(at indexPath: IndexPath) {
        orderList.remove(at: indexPath.row)
        setTotalOrderInfo()
        orderListTable.deleteRows(at: [indexPath], with: .none)
    }
}
