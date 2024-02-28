//
//  ProductPageInteractor.swift
//  Super easy dev
//
//  Created by Куат Оралбеков on 25.02.2024
//

protocol ProductPageInteractorProtocol: AnyObject {
    
    var product: Product {get}
    
    func pickedSize(size: String)
    
    func addToCart()
    
}

class ProductPageInteractor: ProductPageInteractorProtocol {
    
    func pickedSize(size: String) {
        product.size = size
    }
    
    
    var product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    func addToCart() {
        
        if product.size != nil {
            CartManager.shared.addToCart(product)
            presenter?.addedToCart()
        } else {
            presenter?.errorAddingToCart()
        }
        
//        if pickedSize != nil {
//            
//            CartManager.shared.addToCart(product)
//            presenter?.addedToCart()
//        } else {
//            presenter?.errorAddingToCart()
//        }
    }
    
    
    weak var presenter: ProductPagePresenterProtocol?
}
