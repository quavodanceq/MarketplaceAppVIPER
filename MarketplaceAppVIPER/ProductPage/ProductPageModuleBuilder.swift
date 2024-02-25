//
//  ProductPageModuleBuilder.swift
//  Super easy dev
//
//  Created by Куат Оралбеков on 25.02.2024
//

import UIKit

class ProductPageModuleBuilder {
    static func build(product: Product) -> ProductPageViewController {
        let interactor = ProductPageInteractor(product: product)
        let router = ProductPageRouter()
        let presenter = ProductPagePresenter(interactor: interactor, router: router)
        let viewController = ProductPageViewController()
        presenter.view = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
