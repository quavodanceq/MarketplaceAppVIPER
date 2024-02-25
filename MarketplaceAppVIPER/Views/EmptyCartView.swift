//
//  EmptyCartView.swift
//  MarketplaceApp
//
//  Created by Куат Оралбеков on 08.09.2023.
//

import Foundation
import UIKit
import SnapKit

class EmptyCartView: UIView {
    
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupImageView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        
        self.init()
    }
    
    private func setupImageView() {
        
        addSubview(imageView)
        imageView.image = UIImage(named: "emptyCart")
    }
    
    private func setupConstraints() {
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func hide() {
        
        imageView.alpha = 0   
    }
    
    func reveal() {
        
        imageView.alpha = 1
    }
}
