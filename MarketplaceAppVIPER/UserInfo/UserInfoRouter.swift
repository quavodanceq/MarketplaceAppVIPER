//
//  UserInfoRouter.swift
//  Super easy dev
//
//  Created by Куат Оралбеков on 08.03.2024
//

protocol UserInfoRouterProtocol {
    
    func pop()
    
}

class UserInfoRouter: UserInfoRouterProtocol {
    func pop() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
    weak var viewController: UserInfoViewController?
}
