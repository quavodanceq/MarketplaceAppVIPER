//
//  CarouselView.swift
//  MarketplaceApp
//
//  Created by Куат Оралбеков on 08.09.2023.
//

import Foundation
import UIKit
import SnapKit
import FirebaseStorage

class CarouselCell: UICollectionViewCell {
    
    var imageName: String?
    
    private let imageView = UIImageView()
    
    static let cellId = "CarouselCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        addSubview(imageView)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        let imageRef = Storage.storage().reference().child(imageName ?? "")
        imageRef.downloadURL { result in
            switch result {
                
            case .success(let url):
                print(url)
                self.imageView.sd_setImage(with: url)
            case .failure(_):
                break
            }
        }

        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
    
    
    
}
