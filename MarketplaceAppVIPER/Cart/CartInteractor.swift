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
    
    func makeOrder(cart: [Product])
}

class CartInteractor: CartInteractorProtocol {
    
    func makeOrder(cart: [Product]) {
        guard AuthManager.shared.isUsedLoggedIn() else { presenter?.logInError(); return }
        guard CartManager.shared.checkUserInfo() else { presenter?.userInfoError(); return }
        FirebaseManager.shared.addOrderToFirebase(cart: cart)
        CartManager.shared.removeCart()
        presenter?.orderCreationSuccess()
    }
    
    
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

