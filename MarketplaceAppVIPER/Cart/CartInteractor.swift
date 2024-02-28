//
//  CartInteractor.swift
//  Super easy dev
//
//  Created by Куат Оралбеков on 28.02.2024
//

import Foundation
import Combine

protocol CartInteractorProtocol: AnyObject {
    
     func setupPublisher()
    
    func removeFromCart(product: Product)
}

class CartInteractor: CartInteractorProtocol {
    
    func removeFromCart(product: Product) {
        CartManager.shared.removeFromCart(product)
    }
    
    
    weak var presenter: CartPresenterProtocol?
    
    private var cancellable = [AnyCancellable]()
    
    func setupPublisher() {
        
        UserDefaults.standard.publisher(for: \.observableProductsData)
            .map{ data -> [Product] in
                guard let data = data else { return [] }
                return (try? JSONDecoder().decode([Product].self, from: data)) ?? []
            }.sink { products in
                
                self.presenter?.cartContent(content: products)
                
            }.store(in: &cancellable)
        
    }
}

