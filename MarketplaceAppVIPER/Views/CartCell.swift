//
//  CartCell.swift
//  MarketplaceApp
//
//  Created by Куат Оралбеков on 08.09.2023.
//

import Foundation
import UIKit
import FirebaseStorage
import SnapKit

class CartCell: UITableViewCell {
    
    var product: Product?
    
    private let image = UIImageView()
    
    private let nameLabel = UILabel()
    
    private let sizeLabel = UILabel()
    
    private let priceLabel = UILabel()
    
    private let removeButton = UIButton()
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup() {
        setupSizeLabel()
        setupNameLabel()
        setupImageView()
        setupPriceLabel()
        setupPriceLabel()
        setupRemoveButton()
        setupConstraints()
    }
    
    private func setupSizeLabel() {
        
        addSubview(sizeLabel)
        sizeLabel.text = product?.size ?? "123123123"
        sizeLabel.font = UIFont(name: "GillSans-SemiBold", size: 19)
        sizeLabel.textColor = .black
        sizeLabel.numberOfLines = 0
    }
    
    private func setupImageView() {
        addSubview(image)
        image.clipsToBounds = true
        let imageRef = Storage.storage().reference().child(product?.imageName ?? "")
        imageRef.downloadURL { result in
            switch result {
                
            case .success(let url):
                print(url)
                self.image.sd_setImage(with: url)
            case .failure(_):
                break
            }
        }
    }
    
    private func setupNameLabel() {
        addSubview(nameLabel)
        nameLabel.text = product?.name
        nameLabel.font = UIFont(name: "GillSans-SemiBold", size: 19)
        nameLabel.textColor = .black
        nameLabel.numberOfLines = 0
    }
    
    private func setupPriceLabel() {
        addSubview(priceLabel)
        let price = product?.price
        let priceString = "\(price ?? "")$"
        priceLabel.text = priceString
        priceLabel.font = UIFont(name: "GillSans-SemiBold", size: 19)
        priceLabel.textColor = .black
        priceLabel.numberOfLines = 0
        
    }
    
    private func setupRemoveButton() {
        contentView.addSubview(removeButton)
        
        removeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        removeButton.addTarget(self, action: #selector(removeButtonTapped), for: .touchUpInside)
        
    }
    
    @objc private func removeButtonTapped() {
        //CartManager.shared.removeFromCart(product!)
        
    }
    
    private func setupConstraints() {
        
        image.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.height.equalToSuperview().multipliedBy(0.9)
            make.width.equalTo(image.snp.height).multipliedBy(0.8)
            make.centerY.equalToSuperview()
            
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(image.snp.trailing).offset(10)
            
        }
        
        sizeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(image.snp.trailing).offset(10)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10)
            make.leading.equalTo(image.snp.trailing).offset(10)
        }
        removeButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-10)
        }
    }
    
    
    
}


