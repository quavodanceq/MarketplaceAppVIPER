//
//  ProductPageInteractor.swift
//  Super easy dev
//
//  Created by Куат Оралбеков on 25.02.2024
//

protocol ProductPageInteractorProtocol: AnyObject {
    
    var product: Product {get}
    
    var pickedSize: String? { get set }
    
    func addToCart()
    
}

class ProductPageInteractor: ProductPageInteractorProtocol {
    
    var product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    func addToCart() {
        if pickedSize != nil {
            presenter?.addedToCart()
        } else {
            presenter?.errorAddingToCart()
        }
    }
    
    
    var pickedSize: String?
    
    weak var presenter: ProductPagePresenterProtocol?
}
