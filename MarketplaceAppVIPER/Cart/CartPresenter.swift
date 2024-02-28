//
//  CartPresenter.swift
//  Super easy dev
//
//  Created by Куат Оралбеков on 28.02.2024
//

protocol CartPresenterProtocol: AnyObject {
    
    func viewDidLoaded()
    
    func cartContent(content: [Product])
    
    func removedFromCart(product: Product)
}

class CartPresenter {
    weak var view: CartViewProtocol?
    var router: CartRouterProtocol
    var interactor: CartInteractorProtocol

    init(interactor: CartInteractorProtocol, router: CartRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension CartPresenter: CartPresenterProtocol {
    
    func removedFromCart(product: Product) {
        interactor.removeFromCart(product: product)
    }
    
    
    func cartContent(content: [Product]) {
        view?.showCart(content: content)
    }
    
    
    func viewDidLoaded() {
        interactor.setupPublisher()
    }
    
}
