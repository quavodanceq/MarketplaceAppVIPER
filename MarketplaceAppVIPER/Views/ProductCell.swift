//
//  ProductCell.swift
//  MarketplaceApp
//
//  Created by Куат Оралбеков on 08.09.2023.
//

import Foundation
import UIKit
import FirebaseStorage
import SnapKit
import SDWebImage

class ProductCell: UICollectionViewCell {
    
    var product: Product?
    
    private let image = UIImageView()
    
    private let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        layer.borderColor = UIColor.black.cgColor
        setupImageView()
        setupLabel()
        setupConstraints()
    }
    
    private func setupImageView() {
        addSubview(image)
        image.layer.cornerRadius = 20
        image.layer.cornerCurve = .continuous
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
    
    private func setupLabel() {
        
        addSubview(label)
        label.text = product?.name
        label.font = UIFont(name: "GillSans-SemiBold", size: 19)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        label.backgroundColor = .white
    }
    
    private func setupConstraints() {
        
        image.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalToSuperview().multipliedBy(0.8)
        }
        
        label.snp.makeConstraints { make in
            
            make.centerX.equalToSuperview()
            make.top.equalTo(image.snp.bottom)
            make.width.equalTo(image.snp.width)
        }
    }
    
}
