//
//  ProfilePresenter.swift
//  Super easy dev
//
//  Created by Куат Оралбеков on 02.03.2024
//

import UIKit

protocol ProfilePresenterProtocol: AnyObject {
    
    func viewDidloaded()
    
    func logInButtonTapped()
    
    func userIsLoggedIn()
    
    func userIsLoggedOut()
    
    func logOutButtonTapped()
    
    func ordersButtonTapped()
    
}

class ProfilePresenter {
    weak var view: ProfileViewProtocol?
    var router: ProfileRouterProtocol
    var interactor: ProfileInteractorProtocol

    init(interactor: ProfileInteractorProtocol, router: ProfileRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension ProfilePresenter: ProfilePresenterProtocol {
    
    func ordersButtonTapped() {
        router.showOrders()
    }
    
    
    func logOutButtonTapped() {
        interactor.logOut()
    }
    
    
    func userIsLoggedIn() {
        view?.showUserInfo()
    }
    
    func userIsLoggedOut() {
        view?.showLogInButton()
    }
    
    
    func viewDidloaded() {
        interactor.isUserLoggedIn()
    }
    
    
    func logInButtonTapped() {
        interactor.logInWith(viewController: view as! UIViewController)
    }
    
}
