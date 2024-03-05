//
//  ProfileRouter.swift
//  Super easy dev
//
//  Created by Куат Оралбеков on 02.03.2024
//

protocol ProfileRouterProtocol {
    
    func showOrders()
    
}

class ProfileRouter: ProfileRouterProtocol {
    
    func showOrders() {
        let vc = OrdersModuleBuilder.build()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    weak var viewController: ProfileViewController?
}
