//
//  OrderModel.swift
//  MarketplaceApp
//
//  Created by Куат Оралбеков on 09.09.2023.
//

import Foundation

struct OrderModel {
    
    var order: [OrderProduct]
    
    let address: Adress
}

struct OrderProduct {
    
    let name: String
    
    let size: String
}

struct Adress {
    
    let city: String
    
    let street: String
    
    let homeNumber: String
    
    let name: String
    
    let phoneNumber: String
}

struct FetchedOrder {
    
    let order: String
    
    let date: String
    
    let deliveryStatus: String

}
