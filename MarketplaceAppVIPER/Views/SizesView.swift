//
//  SizesView.swift
//  MarketplaceApp
//
//  Created by Куат Оралбеков on 09.09.2023.
//

import Foundation
import UIKit
import SnapKit

class SizesView: UIView {
    
    var delegate: ProductSizeDelegate?
    
    private let sButton = UIButton()
    private let mButton = UIButton()
    private let lButton = UIButton()
    private let xlButton = UIButton()
    private lazy var buttonsStack = UIStackView(arrangedSubviews: [
        sButton,
        mButton,
        lButton,
        xlButton
    ]
    )
    
    private let cartButton = UIButton()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupButtons()
        setupStackView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        self.init()
    }
    
    private func setupButtons() {
        sButton.setTitle("S", for: .normal)
        sButton.backgroundColor = .white
        sButton.setTitleColor(.backgroundColor, for: .normal)
        sButton.layer.borderColor = UIColor.backgroundColor.cgColor
        sButton.layer.borderWidth = 3
        sButton.titleLabel?.font = UIFont(name: "Georgia-Bold", size: 17)!
        sButton.layer.borderColor = UIColor.backgroundColor.cgColor
        sButton.addTarget(self, action: #selector(sButtonTapped), for: .touchUpInside)
        
        mButton.setTitle("M", for: .normal)
        mButton.backgroundColor = .white
        mButton.setTitleColor(.backgroundColor, for: .normal)
        mButton.layer.borderColor = UIColor.backgroundColor.cgColor
        mButton.layer.borderWidth = 3
        mButton.titleLabel?.font = UIFont(name: "Georgia-Bold", size: 17)!
        mButton.layer.borderColor = UIColor.backgroundColor.cgColor
        mButton.addTarget(self, action: #selector(mButtonTapped), for: .touchUpInside)
        
        lButton.setTitle("L", for: .normal)
        lButton.backgroundColor = .white
        lButton.setTitleColor(.backgroundColor, for: .normal)
        lButton.layer.borderColor = UIColor.backgroundColor.cgColor
        lButton.layer.borderWidth = 3
        lButton.titleLabel?.font = UIFont(name: "Georgia-Bold", size: 17)!
        lButton.layer.borderColor = UIColor.backgroundColor.cgColor
        lButton.addTarget(self, action: #selector(lButtonTapped), for: .touchUpInside)
        
        xlButton.setTitle("XL", for: .normal)
        xlButton.backgroundColor = .white
        xlButton.setTitleColor(.backgroundColor, for: .normal)
        xlButton.layer.borderColor = UIColor.backgroundColor.cgColor
        xlButton.layer.borderWidth = 3
        xlButton.titleLabel?.font = UIFont(name: "Georgia-Bold", size: 17)!
        xlButton.layer.borderColor = UIColor.backgroundColor.cgColor
        xlButton.addTarget(self, action: #selector(xlButtonTapped), for: .touchUpInside)
    }
    
    private func setupStackView() {
        
        addSubview(buttonsStack)
        buttonsStack.axis = .horizontal
        buttonsStack.spacing = 5
        buttonsStack.distribution = .fillEqually
    }

    private func setupConstraints() {
        
        buttonsStack.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    @objc private func sButtonTapped() {
        
        sButton.backgroundColor = .backgroundColor
        sButton.setTitleColor(.white, for: .normal)
        
        mButton.backgroundColor = .white
        mButton.setTitleColor(.backgroundColor, for: .normal)
        
        lButton.backgroundColor = .white
        lButton.setTitleColor(.backgroundColor, for: .normal)
        
        xlButton.backgroundColor = .white
        xlButton.setTitleColor(.backgroundColor, for: .normal)
        delegate?.productWithSizeAdded(size: "S")
    }
    
    @objc private func mButtonTapped() {
        sButton.backgroundColor = .white
        sButton.setTitleColor(.backgroundColor, for: .normal)
        
        mButton.backgroundColor = .backgroundColor
        mButton.setTitleColor(.white, for: .normal)
        
        lButton.backgroundColor = .white
        lButton.setTitleColor(.backgroundColor, for: .normal)
        
        xlButton.backgroundColor = .white
        xlButton.setTitleColor(.backgroundColor, for: .normal)
        delegate?.productWithSizeAdded(size: "M")
    }
    
    @objc private func lButtonTapped() {
        sButton.backgroundColor = .white
        sButton.setTitleColor(.backgroundColor, for: .normal)
        
        mButton.backgroundColor = .white
        mButton.setTitleColor(.backgroundColor, for: .normal)
        
        lButton.backgroundColor = .backgroundColor
        lButton.setTitleColor(.white, for: .normal)
        
        xlButton.backgroundColor = .white
        xlButton.setTitleColor(.backgroundColor, for: .normal)
        delegate?.productWithSizeAdded(size: "L")
    }
    
    @objc private func xlButtonTapped() {
        sButton.backgroundColor = .white
        sButton.setTitleColor(.backgroundColor, for: .normal)
        
        mButton.backgroundColor = .white
        mButton.setTitleColor(.backgroundColor, for: .normal)
        
        lButton.backgroundColor = .white
        lButton.setTitleColor(.backgroundColor, for: .normal)
        
        xlButton.backgroundColor = .backgroundColor
        xlButton.setTitleColor(.white, for: .normal)
        
        delegate?.productWithSizeAdded(size: "XL")
    }
    
}

protocol ProductSizeDelegate {
    
    func productWithSizeAdded(size: String)
    
}
