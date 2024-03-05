//
//  OrdersModuleBuilder.swift
//  Super easy dev
//
//  Created by Куат Оралбеков on 05.03.2024
//

import UIKit

class OrdersModuleBuilder {
    static func build() -> OrdersViewController {
        let interactor = OrdersInteractor()
        let router = OrdersRouter()
        let presenter = OrdersPresenter(interactor: interactor, router: router)
        let viewController = OrdersViewController()
        presenter.view  = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
