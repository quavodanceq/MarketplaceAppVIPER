//
//  ProductModel.swift
//  MarketplaceApp
//
//  Created by Куат Оралбеков on 07.09.2023.
//

import Foundation

struct Product {
    
    let imageName: String
    
    let name: String
    
    let price: String
    
    let imagesNames: [String]
    
    let sizes: [String]
    
    var size: String?
    
}

extension Product: Codable {
    
}

extension Product: Equatable {
    
}
