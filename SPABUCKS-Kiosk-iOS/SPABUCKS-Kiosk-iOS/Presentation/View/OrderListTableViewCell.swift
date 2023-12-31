//
//  OrderListTableViewCell.swift
//  SPABUCKS-Kiosk-iOS
//
//  Created by t2023-m0035 on 12/28/23.
//

import UIKit

class OrderListTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "tableViewCell"
    
    // MARK: - UI Properties
    
    let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    let itemNameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    let itemPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        
        return label
    }()
    
    let quantityLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    let minusButton: ColorButton = {
        let button = ColorButton(title: "-", color: UIColor.systemGray5)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    let plusButton: ColorButton = {
        let button = ColorButton(title: "+", color: UIColor.red)
        
        return button
    }()
    
    let deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("X", for: .normal)
        button.setTitleColor(.systemGray, for: .normal)
        
        return button
    }()
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        itemImageView.image = nil
        itemNameLabel.text = nil
        itemPriceLabel.text = nil
        quantityLabel.text = nil
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupUI()
    }
}

// MARK: - Extensions

extension OrderListTableViewCell {
    
    private func setupUI() {
        
        [itemImageView, itemNameLabel, itemPriceLabel, quantityLabel, plusButton, minusButton, deleteButton].forEach {
            contentView.addSubview($0)
        }
        
        // MARK: Auto Layout
        
        // itemImageView
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            itemImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            itemImageView.widthAnchor.constraint(equalToConstant: 70),
            itemImageView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        // itemNameLabel
        itemNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemNameLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 15),
            itemNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25)
        ])
        
        // itemPriceLabel
        itemPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemPriceLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 15),
            itemPriceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25)
        ])
        
        // minusButton
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            minusButton.leadingAnchor.constraint(equalTo: quantityLabel.leadingAnchor, constant: -30),
            minusButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            minusButton.widthAnchor.constraint(equalToConstant: 20),
            minusButton.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        // quantityLabel
        quantityLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            quantityLabel.leadingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: -20),
            quantityLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        // plusButton
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            plusButton.leadingAnchor.constraint(equalTo: deleteButton.leadingAnchor, constant: -25),
            plusButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: 20),
            plusButton.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        // deleteButton
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            deleteButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
}
