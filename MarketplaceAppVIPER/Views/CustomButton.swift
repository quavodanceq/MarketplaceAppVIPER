//
//  CustomButton.swift
//  MarketplaceAppVIPER
//
//  Created by Куат Оралбеков on 02.03.2024.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.titleLabel?.font =  UIFont(name: "Copperplate-Bold", size: 18)!
        self.backgroundColor = .white
        self.setTitleColor(.backgroundColor, for: .normal)
        self.layer.borderColor = UIColor.backgroundColor.cgColor
        self.layer.borderWidth = 2
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 1
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowOpacity = 0.5
    }
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
