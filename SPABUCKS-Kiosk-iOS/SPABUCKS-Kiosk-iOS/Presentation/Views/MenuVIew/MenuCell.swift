//
//  MenuCell.swift
//  SPABUCKS-Kiosk-iOS
//
//  Created by Jason Yang on 12/28/23.
//

import UIKit

// MARK: - imageView, nameLabel 셀 설정 서브 클래스

class MenuCell: UICollectionViewCell {
    //셀의 재사용을 위해 사용될 식별자
    static let cellId = "collectionViewCell"
    
    //UIImageView, UILabel 객체화
    let imageView = UIImageView()
    let nameLabel = UILabel()
    let priceLabel = UILabel()
    
    // 초기화
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func viewCell() {
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
        nameLabel.numberOfLines = 2
        nameLabel.lineBreakMode = .byWordWrapping
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10), // 레이블 위 여백
            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 5), // 이미지로부터 왼쪽 여백
//            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor), // 레이블 중앙 위치
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 5), // 오른쪽 여백
        ])

        
        priceLabel.textAlignment = .left
        contentView.addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 5), // 이미지로부터 왼쪽 여백
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
}

