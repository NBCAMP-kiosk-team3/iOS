//
//  MenuView.swift
//  SPABUCKS-Kiosk-iOS
//
//  Created by Joon Baek on 2023/12/26.
//
import Foundation
import UIKit


class MenuView: UIView {

// MARK: - 메뉴 프로퍼티 정의
    
    var dataSource: [SpabucksMenuItem] = []
    var drinkItems: [SpabucksMenuItem] = [
        SpabucksMenuItem(id: 0, name: "Caffè Americano", imageName: "americano", price: 5.7),
        SpabucksMenuItem(id: 1, name: "Caramel Macchiato", imageName: "caramel_macchiato", price: 5.9),
        SpabucksMenuItem(id: 2, name: "Flat White", imageName: "flat_white", price: 6.0),
        SpabucksMenuItem(id: 3, name: "Caffe Latte", imageName: "Caffe Latte", price: 8.0)]
    
    var foodItems: [SpabucksMenuItem] = [
        SpabucksMenuItem(id: 0, name: "Croissant", imageName: "croissant", price: 5.0),
        SpabucksMenuItem(id: 1, name: "Sandwich", imageName: "sandwich", price: 6.0),
        SpabucksMenuItem(id: 2, name: "Salad", imageName: "salad", price: 6.5),
        SpabucksMenuItem(id: 3, name: "Scorn", imageName: "scorn", price: 5.5)]
    
    var merchandiserItems: [SpabucksMenuItem] = [
        SpabucksMenuItem(id: 0, name: "Tumbler", imageName: "Tumbler", price: 5.5),
        SpabucksMenuItem(id: 1, name: "Pen", imageName: "Pen", price: 15.0),
        SpabucksMenuItem(id: 2, name: "Notebook", imageName: "Notebook", price: 12.5),
        SpabucksMenuItem(id: 3, name: "Tent", imageName: "Tent", price: 25.0)]
    
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

extension MenuView {
    func showBeverageView() {
        // 음료버튼을 탭했을 때 호출 -> 메뉴에 음료를 보여주는 것을 구현
        dataSource = drinkItems
        collectionView.reloadData()
    }
    func foodMenuButton() {
        dataSource = foodItems
        collectionView.reloadData()
    }
    
    func mdMenuButton() {
        dataSource = merchandiserItems
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegate

extension MenuView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 셀 선택 시 처리할 내용
        print("Selected: \(dataSource[indexPath.row])")
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

// MARK: - UICollectionViewDataSource

extension MenuView: UICollectionViewDataSource {
    // 컬랙션 뷰의 아이템이 몇개인지 -> Items 프로퍼티 갯수에 따라 변경
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    // 컬랙션뷰 하나의 단위가 cell이라고 한다. 어떤 모양의 cell인지
    // UIKit이 아래 매소드(collectionView ~ cellForItemAt)를 호출
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath) as? MenuCell else {
            return UICollectionViewCell()
        }
        //
        cell.imageView.image = UIImage(named: dataSource[indexPath.row].imageName)
        cell.nameLabel.text = dataSource[indexPath.row].name
        cell.priceLabel.text = String(dataSource[indexPath.row].price)
//        print(indexPath)
//        print(dataSource[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MenuView: UICollectionViewDelegateFlowLayout {
    
    // 컬랙션뷰의 셀의 크기를 반환하는 매서드
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 70)
    }
    
    // 지정된 섹션의 여백을 반환하는 매서드
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 5, right: 5)
        
    }

    // 지정된 섹션의 위 아래 간격을 지정하는 매서드, scrollDirection이 horizontal이면 수직이 행이 되고 vertical이면 수평이 행이 된다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
        
    }

    // 지정된 섹션의 좌우 간격을 지정하는 매서드
    // 지정된 섹션의 각 행과열에 scroll이 vertical일경우, 같은 행에 있는 item들의 간격을 지정하고, scroll이 horizontal 일경우, 같은 열에 있는 item들의 간격을 지정한다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 14
    }

    // /지정된 섹션의 헤더뷰의 크기를 반환하는 메서드. 크기를 지정하지 않으면 화면에 보이지 않는다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 400, height: 20)
        
        
    }

    // 지정된 섹션의 푸터뷰의 크기를 반환하는 매서드, 크기를 지정하지 않으면 화면에 보이지 않는다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: 400, height: 20)
    }
    
}


extension MenuView {
    private func setUI() {
        //MenuView의 높이 지정(고정값, equalToConstant) : 455
        heightAnchor.constraint(equalToConstant: 455).isActive = true

        collectionView.dataSource = self // UICollectionViewDataSource 프로토콜 준수
        collectionView.delegate = self // UICollectionViewDataSource 프로토콜 준수
        //collectionView에 사용할 셀 클래스 등록 MenuCell을 클래스로 사용, 식별자로 MenuCell.cellId 사용
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: MenuCell.cellId)
        collectionView.backgroundColor = .white //collectionView 배경색 :
        addSubview(collectionView) // collectionView를 MenuView에 추가

        collectionView.translatesAutoresizingMaskIntoConstraints = false //오토레이아웃을 사용하지 않도록 설정
        NSLayoutConstraint.activate([ // 오토레이아웃 제약조건을 MenuView의 모든 가장자리에 설정
            //topAnchor(위), bottomAnchor(아래), leadingAnchor(왼쪽에서 시작), trailingAnchor(오른쪽에서 시작)
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}

// MARK: - imageView, nameLabel 셀 설정 서브 클래스

class MenuCell: UICollectionViewCell {
    //UIImageView에 position ambiguous for UIImageView -> UIImageView UIImageView 에 위치가 애매합니다. (질문) 셀 안에 UIImageView와 UILabel 넣기
    
    //셀의 재사용을 위해 사용될 식별자
    static let cellId = "CellId"
    
    //UIImageView, UILabel 객체화
    let imageView = UIImageView()
    let nameLabel = UILabel()
    let priceLabel = UILabel()
    
    // 초기화
    override init(frame: CGRect) {
        super.init(frame: frame)
        cellViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func cellViews() {
        // imageView 설정
        backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false //오토레이아웃 비동기화
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10), // 위 여백
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10), // 왼쪽 여백
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10), // 아래 여백
            imageView.widthAnchor.constraint(equalToConstant: 50), //이미지 넓이
            imageView.heightAnchor.constraint(equalToConstant: 50) //이미지 높이
        ])
            
        // nameLabel 설정
        nameLabel.textAlignment = .left
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10), // 레이블 위 여백
            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 5), // 이미지로부터 왼쪽 여백
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor), // 레이블 중앙 위치
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 5) // 오른쪽 여백
        ])
        
        priceLabel.textAlignment = .left
        contentView.addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 30), // 레이블 위 여백
            priceLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 5), // 이미지로부터 왼쪽 여백
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 5) // 오른쪽 여백
        ])
    }
}
