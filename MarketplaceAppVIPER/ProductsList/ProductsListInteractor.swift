//
//  ProductsListInteractor.swift
//  Super easy dev
//
//  Created by Куат Оралбеков on 25.02.2024
//

protocol ProductsListInteractorProtocol: AnyObject {
    
    func fetchProductsList()
    
}

class ProductsListInteractor: ProductsListInteractorProtocol {
    
    func fetchProductsList() {
        
        FirebaseManager.shared.fetchProducts { products in
            self.presenter?.productsListFetched(products: products)
        }
    }
    
    weak var presenter: ProductsListPresenterProtocol?
}
