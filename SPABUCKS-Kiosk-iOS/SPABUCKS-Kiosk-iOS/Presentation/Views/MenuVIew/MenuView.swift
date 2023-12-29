//
//  MenuView.swift
//  SPABUCKS-Kiosk-iOS
//
//  Created by JasonYang on 2023/12/29.
//
import UIKit

class MenuView: UIView {
    
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
    
    // MARK: - Life Cycle
    
    private let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
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
    func foodMenuView() {
        dataSource = foodItems
        collectionView.reloadData()
    }
    
    func mdMenuView() {
        dataSource = merchandiserItems
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegate

extension MenuView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 셀 선택 시 처리할 내용
        print("Selected: \(dataSource[indexPath.row])")
        //        let selectedData = dataSource[indexPath.row] // 선택된 셀의 데이터
        //        let orderListView = OrderListView()
        //        orderListView.tempOrderList.append(selectedData)
        
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
        cell.imageView.image = UIImage(named: dataSource[indexPath.row].imageName)
        cell.nameLabel.text = dataSource[indexPath.row].name
        cell.priceLabel.text = String("\(Int(dataSource[indexPath.row].price)) 원")
        
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
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    //        return 30
    //    }
    
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
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: MenuCell.collectionViewCellIdentifier)
        collectionView.backgroundColor = .white
        addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
}



