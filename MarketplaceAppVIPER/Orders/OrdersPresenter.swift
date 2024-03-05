//
//  OrdersPresenter.swift
//  Super easy dev
//
//  Created by Куат Оралбеков on 05.03.2024
//

protocol OrdersPresenterProtocol: AnyObject {
    
    func viewDidLoaded()
    
    func ordersWasFetched(orders: [FetchedOrder])
    
}

class OrdersPresenter {
    weak var view: OrdersViewProtocol?
    var router: OrdersRouterProtocol
    var interactor: OrdersInteractorProtocol

    init(interactor: OrdersInteractorProtocol, router: OrdersRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension OrdersPresenter: OrdersPresenterProtocol {
    
    func ordersWasFetched(orders: [FetchedOrder]) {
        view?.showOrders(orders: orders)
    }
    
    
    func viewDidLoaded() {
        interactor.fetchOrders()
    }
    
}
