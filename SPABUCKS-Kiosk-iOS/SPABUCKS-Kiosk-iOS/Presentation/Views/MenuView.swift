//
//  MenuView.swift
//  SPABUCKS-Kiosk-iOS
//
//  Created by Joon Baek on 2023/12/26.
//
import Foundation
import UIKit


class MenuView: UIView {

//MARK: - 메뉴 프로퍼티 정의
    var drinkItems: [SpabucksMenuItem] = [
        SpabucksMenuItem(id: 0, name: "Caffè Americano", imageName: "americano"),
        SpabucksMenuItem(id: 1, name: "Caramel Macchiato", imageName: "caramel_macchiato"),
        SpabucksMenuItem(id: 2, name: "Flat White", imageName: "flat_white"),
        SpabucksMenuItem(id: 3, name: "Caffe Latte", imageName: "Caffe Latte")]
    
    var foodItems: [SpabucksMenuItem] = [
        SpabucksMenuItem(id: 0, name: "Croissant", imageName: "croissant"),
        SpabucksMenuItem(id: 1, name: "Sandwich", imageName: "sandwich"),
        SpabucksMenuItem(id: 2, name: "Salad", imageName: "salad"),
        SpabucksMenuItem(id: 3, name: "Scorn", imageName: "scorn")]
    
    var merchandiserItems: [SpabucksMenuItem] = [
        SpabucksMenuItem(id: 0, name: "Tumbler", imageName: "Tumbler"),
        SpabucksMenuItem(id: 1, name: "Pen", imageName: "Pen"),
        SpabucksMenuItem(id: 2, name: "Notebook", imageName: "Notebook"),
        SpabucksMenuItem(id: 3, name: "Tent", imageName: "Tent")]
    
    // collectionView를 UICollectionView의 타입으로 선언
    private let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override init(frame: CGRect) {
          super.init(frame: frame)
          setUI()
      }
    
    //인스턴스 초기화
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UICollectionViewDelegate
extension MenuView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 셀 선택 시 처리할 내용
        print("select")
    }
}

// MARK: - UICollectionViewDataSource
extension MenuView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return drinkItems.count
        case 1:
            return foodItems.count
        case 2:
            return merchandiserItems.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath) as! MenuCell
        cell.backgroundColor = .blue
        
        var item: SpabucksMenuItem
        
        if indexPath.section == 0 {
            item = drinkItems[indexPath.item]
        } else if indexPath.section == 1 {
            item = foodItems[indexPath.item]
        } else {
            item = merchandiserItems[indexPath.item]
        }
        
        cell.imageView.image = UIImage(named: item.imageName)
        cell.nameLabel.text = item.name
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MenuView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 110)
    }
}


extension MenuView {
    private func setUI() {
        backgroundColor = .systemBlue
        heightAnchor.constraint(equalToConstant: 455).isActive = true

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: MenuCell.cellId)
        collectionView.backgroundColor = .white
        addSubview(collectionView)

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}

//MARK: - imageView, nameLabel 셀 설정 서브 클래스
private class MenuCell: UICollectionViewCell {
    
    static let cellId = "CellId"
    
    let imageView = UIImageView()
    let nameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        // imageView 설정
        backgroundColor = .green
        imageView.contentMode = .scaleToFill
        addSubview(imageView) //stack view에서는 따로 논다. 
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 50) // 이미지 높이에 맞게 조절
        ])
        
        // nameLabel 설정
        nameLabel.textAlignment = .center
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
