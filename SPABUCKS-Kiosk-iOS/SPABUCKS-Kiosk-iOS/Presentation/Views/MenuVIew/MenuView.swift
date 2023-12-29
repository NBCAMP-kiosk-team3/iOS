//
//  MenuView.swift
//  SPABUCKS-Kiosk-iOS
//
//  Created by Joon Baek on 2023/12/26.
//
import UIKit

class MenuView: UIView {
    
    // MARK: - 메뉴 프로퍼티 정의
    
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
    // 컬랙션 뷰의 아이템이 몇개인지 -> Items 프로퍼티 갯수에 따라 변경
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    //guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCell.identifier, for: indexPath) as? MenuCell else { }
    // 컬랙션뷰 하나의 단위가 cell이라고 한다. 어떤 모양의 cell인지
    // UIKit이 아래 매소드(collectionView ~ cellForItemAt)를 호출
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCell.collectionViewCellIdentifier, for: indexPath) as? MenuCell else {
            
            return UICollectionViewCell()
        }
        //
        cell.imageView.image = UIImage(named: dataSource[indexPath.row].imageName)
        cell.nameLabel.text = dataSource[indexPath.row].name
        cell.priceLabel.text = String("\(Int(dataSource[indexPath.row].price)) 원")
        //        print(indexPath)
        //        print(dataSource[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MenuView: UICollectionViewDelegateFlowLayout {
    
    // 컬랙션뷰의 셀의 크기를 반환하는 매서드
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 165, height: 70)
    }
    
    // 지정된 섹션의 여백을 반환하는 매서드
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }
    
    // 지정된 섹션의 위 아래 간격을 지정하는 매서드, scrollDirection이 horizontal이면 수직이 행이 되고 vertical이면 수평이 행이 된다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 30
        
    }
    
    // 지정된 섹션의 좌우 간격을 지정하는 매서드
    // 지정된 섹션의 각 행과열에 scroll이 vertical일경우, 같은 행에 있는 item들의 간격을 지정하고, scroll이 horizontal 일경우, 같은 열에 있는 item들의 간격을 지정한다.
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    //        return 30
    //    }
    
    // /지정된 섹션의 헤더뷰의 크기를 반환하는 메서드. 크기를 지정하지 않으면 화면에 보이지 않는다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: 400, height: 15)
        
        
    }
    
    // 지정된 섹션의 푸터뷰의 크기를 반환하는 매서드, 크기를 지정하지 않으면 화면에 보이지 않는다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        return CGSize(width: 400, height: 15)
    }
    
}

extension MenuView {
    private func setUI() {
        //MenuView의 높이 지정(고정값, equalToConstant) : 455
        heightAnchor.constraint(equalToConstant: 455).isActive = true
        
        collectionView.dataSource = self // UICollectionViewDataSource 프로토콜 준수
        collectionView.delegate = self // UICollectionViewDataSource 프로토콜 준수
        //collectionView에 사용할 셀 클래스 등록 MenuCell을 클래스로 사용, 식별자로 MenuCell.cellId 사용
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: MenuCell.collectionViewCellIdentifier)
        collectionView.backgroundColor = .white//collectionView 배경색 :
        addSubview(collectionView) // collectionView를 MenuView에 추가
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false //오토레이아웃을 사용하지 않도록 설정
        NSLayoutConstraint.activate([ // 오토레이아웃 제약조건을 MenuView의 모든 가장자리에 설정
            //topAnchor(위), bottomAnchor(아래), leadingAnchor(왼쪽에서 시작), trailingAnchor(오른쪽에서 시작)
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
                                    ])
    }
}



