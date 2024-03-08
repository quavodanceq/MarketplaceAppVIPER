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
    
    func makeOrderButtonTapped(cart: [Product])
    
    func logInError()
    
    func userInfoError()
    
    func orderCreationSuccess()
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
    
    func logInError() {
        view?.presentAlert(title: "Something went wrong", message: "You need to log in to make order")
    }
    
    func userInfoError() {
        view?.presentAlert(title: "Something went wrong", message: "Provide all information to make order")
    }
    
    func orderCreationSuccess() {
        view?.presentAlert(title: "Success", message: "Order created successfully")
    }
    
    
    func makeOrderButtonTapped(cart: [Product]) {
        interactor.makeOrder(cart: cart)
    }
    
    
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
