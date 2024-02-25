//
//  OrderCell.swift
//  MarketplaceApp
//
//  Created by Куат Оралбеков on 10.09.2023.
//

import Foundation
import UIKit

class OrderCell: UITableViewCell {
    
    var order: FetchedOrder?
    
    private let orderLabel = UILabel()
    
    private let orderDateLabel = UILabel()
    
    private let orderStatusLabel = UILabel()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    func setup() {
        
        setupOrderLabel()
        setupOrderDataLabel()
        setupOrderStatusLabel()
        setupConstraints()
    }
    
    private func setupOrderLabel() {
        
        addSubview(orderLabel)
        orderLabel.text = order?.order
        orderLabel.font = UIFont(name: "GillSans-SemiBold", size: 19)
        orderLabel.numberOfLines = 0
    }
    
    private func setupOrderDataLabel() {
        
        addSubview(orderDateLabel)
        orderDateLabel.text = order?.date
        orderDateLabel.font = UIFont(name: "GillSans-SemiBold", size: 19)

        orderDateLabel.numberOfLines = 0
    }
    
    private func setupOrderStatusLabel() {
        
        addSubview(orderStatusLabel)
        orderStatusLabel.text = "Order status: \(String(describing: order?.deliveryStatus ?? ""))"
        orderStatusLabel.font = UIFont(name: "GillSans-SemiBold", size: 21)
        orderStatusLabel.numberOfLines = 0
    }
    
    private func setupConstraints() {
        orderLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        orderDateLabel.snp.makeConstraints { make in
            make.top.equalTo(orderLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(10)
        }
        
        orderStatusLabel.snp.makeConstraints { make in
            make.top.equalTo(orderDateLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
}
