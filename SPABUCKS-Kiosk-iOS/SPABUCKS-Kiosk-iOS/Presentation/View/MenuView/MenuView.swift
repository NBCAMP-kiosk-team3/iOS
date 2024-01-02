//
//  MenuView.swift
//  SPABUCKS-Kiosk-iOS
//
//  Created by JasonYang on 2023/12/29.
//
import UIKit

// MARK: - MenuView

final class MenuView: UIView {
    
    weak var delegate: MenuDataDelegate?
    
    // MARK: - Properties
    
    var dataSource: [SpabucksMenuItem] = []
    var drinkItems: [SpabucksMenuItem] = [
        SpabucksMenuItem(id: 0, name: "Caffè Americano", imageName: "americano", price: 5700),
        SpabucksMenuItem(id: 1, name: "Caramel Macchiato", imageName: "caramel_macchiato", price: 5900),
        SpabucksMenuItem(id: 2, name: "Flat White", imageName: "flat_white", price: 6000),
        SpabucksMenuItem(id: 3, name: "Caffe Latte", imageName: "Caffe Latte", price: 8000)]
    
    var foodItems: [SpabucksMenuItem] = [
        SpabucksMenuItem(id: 0, name: "Croissant", imageName: "croissant", price: 5000),
        SpabucksMenuItem(id: 1, name: "Sandwich", imageName: "sandwich", price: 6000),
        SpabucksMenuItem(id: 2, name: "Salad", imageName: "salad", price: 6000),
        SpabucksMenuItem(id: 3, name: "Scorn", imageName: "scorn", price: 5500)]
    
    var merchandiserItems: [SpabucksMenuItem] = [
        SpabucksMenuItem(id: 0, name: "Tumbler", imageName: "Tumbler", price: 5500),
        SpabucksMenuItem(id: 1, name: "Pen", imageName: "Pen", price: 1500),
        SpabucksMenuItem(id: 2, name: "Notebook", imageName: "Notebook", price: 12500),
        SpabucksMenuItem(id: 3, name: "Tent", imageName: "Tent", price: 25000)]
    
    // MARK: - UI Properties
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: MenuCell.collectionViewCellIdentifier)
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
    private let orderView = OrderListView()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension MenuView {
    func showBeverageView() {
        dataSource = drinkItems
        collectionView.reloadData()
    }
    
    func showFoodMenuView() {
        dataSource = foodItems
        collectionView.reloadData()
    }
    
    func showMdMenuView() {
        dataSource = merchandiserItems
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegate

extension MenuView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedData = dataSource[indexPath.row] // 선택된 셀의 데이터
        delegate?.didSelectMenuItem(selectedData)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

// MARK: - UICollectionViewDataSource

extension MenuView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCell.collectionViewCellIdentifier, for: indexPath) as? MenuCell else {
            
            return UICollectionViewCell()
        }
        
        let menuItem = dataSource[indexPath.row]
        cell.configure(with: menuItem)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MenuView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 165, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: 400, height: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        return CGSize(width: 400, height: 15)
    }
}

extension MenuView {
    private func setUI() {
        heightAnchor.constraint(equalToConstant: 455).isActive = true
    }
    
    private func setLayout() {
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
}
