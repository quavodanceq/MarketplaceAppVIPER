//
//  ProductPagePresenter.swift
//  Super easy dev
//
//  Created by Куат Оралбеков on 25.02.2024
//

protocol ProductPagePresenterProtocol: AnyObject {
    
    func viewDidLoaded()
    
    func addToCartButtonTapped()
    
    func sizePicked(size : String)
    
    func addedToCart()
    
    func errorAddingToCart()
    
}

class ProductPagePresenter: ProductPagePresenterProtocol {
    
    func viewDidLoaded() {
        view?.set(product: interactor.product)
    }
    
    func addedToCart() {
        view?.showSuccessAlert()
    }
    
    func errorAddingToCart() {
        view?.showErrorAlert()
    }
    
    
    func sizePicked(size: String) {
        interactor.pickedSize = size
        
    }
    
    
    
    
    
    weak var view: ProductPageViewProtocol?
    var router: ProductPageRouterProtocol
    var interactor: ProductPageInteractorProtocol
    
    init(interactor: ProductPageInteractorProtocol, router: ProductPageRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func addToCartButtonTapped() {
        interactor.addToCart()
    }
    
}

//extension ProductPagePresenter: ProductPagePresenterProtocol {
//    var pickedSize: String?
//
//
//
//
//}
