//
//  Cell.swift
//  MarketplaceApp
//
//  Created by Куат Оралбеков on 07.09.2023.
//

import UIKit
import SnapKit
import SDWebImage
import FirebaseStorage

class Cell: UITableViewCell {
    
    var product: Product?
    
    private let image = UIImageView()
    
    private let label = UILabel()
    
    
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
        backgroundColor = .red
        setupImageView()
        setupLabel()
        setupConstraints()
    }
    
    private func setupImageView() {
        addSubview(image)
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
    }
    
    private func setupConstraints() {
        
        image.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
    }
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
