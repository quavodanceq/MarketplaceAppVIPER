//
//  OrdersInteractor.swift
//  Super easy dev
//
//  Created by Куат Оралбеков on 05.03.2024
//

protocol OrdersInteractorProtocol: AnyObject {
    
    func fetchOrders()
    
}

class OrdersInteractor: OrdersInteractorProtocol {
    
    func fetchOrders() {
        FirebaseManager.shared.fetchOrders { orders in
            if orders != nil {
                self.presenter?.ordersWasFetched(orders: orders ?? [])
            }
        }
    }
    
    weak var presenter: OrdersPresenterProtocol?
}
