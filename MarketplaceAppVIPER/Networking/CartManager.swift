//
//  CartManager.swift
//  MarketplaceApp
//
//  Created by Куат Оралбеков on 08.09.2023.
//

import Foundation
import Combine

class CartManager {
    
    private init() {}
    
    static let shared = CartManager()
    
    let userDefaults = UserDefaults.standard

    func addToCart(_ product: Product) {
        
        userDefaults.products.append(product)
    }

    func removeFromCart(_ product: Product) {
        
        let cart = userDefaults.products
        guard let index = cart.firstIndex(of: product) else {return}
        userDefaults.products.remove(at: index)
    }
    
    func removeCart() {
        
        userDefaults.products = [Product]()
    }
    
    func checkUserInfo() -> Bool{
        
        let userDefaults = UserDefaults.standard
        guard let name = userDefaults.object(forKey: "name") else { return false}
        guard let city = userDefaults.object(forKey: "city") else { return false}
        guard let street = userDefaults.object(forKey: "street") else { return false}
        guard let homeNumber = userDefaults.object(forKey: "homeNumber") else { return false}
        return true
    }
}
