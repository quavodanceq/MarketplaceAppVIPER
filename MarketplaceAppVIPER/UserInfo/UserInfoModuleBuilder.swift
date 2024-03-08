//
//  UserInfoModuleBuilder.swift
//  Super easy dev
//
//  Created by Куат Оралбеков on 08.03.2024
//

import UIKit

class UserInfoModuleBuilder {
    static func build() -> UserInfoViewController {
        let interactor = UserInfoInteractor()
        let router = UserInfoRouter()
        let presenter = UserInfoPresenter(interactor: interactor, router: router)
        let viewController = UserInfoViewController()
        presenter.view  = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
