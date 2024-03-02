//
//  MainModuleBuilder.swift
//  Super easy dev
//
//  Created by Куат Оралбеков on 26.02.2024
//

import UIKit
import Foundation

class MainModuleBuilder {
    static func build() -> MainViewProtocol {
        let interactor = MainInteractor()
        let router = MainRouter()
        let presenter = MainPresenter(interactor: interactor, router: router)

        let listVC = UINavigationController(rootViewController: ProductsListModuleBuilder.build())
        listVC.tabBarItem.title = "List"
        listVC.tabBarItem.image = UIImage(systemName: "bag")
        let cartVC = CartModuleBuilder.build()
        cartVC.tabBarItem.title = "Cart"
        cartVC.tabBarItem.image = UIImage(systemName: "cart")
        let profileVC = UINavigationController(rootViewController: ProfileModuleBuilder.build())
        profileVC.tabBarItem.title = "Profile"
        profileVC.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        let viewController = MainViewController()
        viewController.viewControllers = [listVC,
                                          cartVC,
                                          profileVC
        ]
        presenter.view  = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
