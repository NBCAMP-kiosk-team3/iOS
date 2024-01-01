//
//  MenuCell.swift
//  SPABUCKS-Kiosk-iOS
//
//  Created by Jason Yang on 12/28/23.
//

import UIKit

final class MenuCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let collectionViewCellIdentifier = "CollectionViewCellIdentifier"
    
    // MARK: - UI Properties
    
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let priceLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        viewCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

// MARK: - Extensions

extension MenuCell {
    private func viewCell() {
        backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10), // 위 여백
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            imageView.widthAnchor.constraint(equalToConstant: 50),
            imageView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        nameLabel.textAlignment = .left
        nameLabel.numberOfLines = 2
        nameLabel.lineBreakMode = .byWordWrapping
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 5),
        ])
        
        priceLabel.textAlignment = .left
        contentView.addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 5),
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
    
    func configure(with item: SpabucksMenuItem) {
        imageView.image = UIImage(named: item.imageName)
        nameLabel.text = item.name
        priceLabel.text = String("\(Int(item.price)) 원")
    }
}

