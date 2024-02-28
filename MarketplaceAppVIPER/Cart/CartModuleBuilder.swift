//
//  CartModuleBuilder.swift
//  Super easy dev
//
//  Created by Куат Оралбеков on 28.02.2024
//

import UIKit

class CartModuleBuilder {
    static func build() -> CartViewController {
        let interactor = CartInteractor()
        let router = CartRouter()
        let presenter = CartPresenter(interactor: interactor, router: router)
        let viewController = CartViewController()
        presenter.view  = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
