//
//  ProductsListModuleBuilder.swift
//  Super easy dev
//
//  Created by Куат Оралбеков on 25.02.2024
//

import UIKit

class ProductsListModuleBuilder {
    static func build() -> ProductsListViewController {
        let interactor = ProductsListInteractor()
        let router = ProductsListRouter()
        let presenter = ProductsListPresenter(interactor: interactor, router: router)
        let viewController = ProductsListViewController()
        presenter.view  = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
