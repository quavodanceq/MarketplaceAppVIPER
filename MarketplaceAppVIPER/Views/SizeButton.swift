//
//  SizeButton.swift
//  MarketplaceApp
//
//  Created by Куат Оралбеков on 09.09.2023.
//

import Foundation
import UIKit

class SizeButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }

    convenience init(size: String) {
        self.init()
        self.titleLabel?.text = size
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.titleLabel?.textColor = .backgroundColor
        
        self.backgroundColor = .white
    }
    
}
