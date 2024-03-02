//
//  ProfileInteractor.swift
//  Super easy dev
//
//  Created by Куат Оралбеков on 02.03.2024
//

import UIKit

protocol ProfileInteractorProtocol: AnyObject {
    
    func logInWith(viewController: UIViewController)
    
    func isUserLoggedIn()
    
    func logOut()
    
}

class ProfileInteractor: ProfileInteractorProtocol {
    
    func logOut() {
        AuthManager.shared.logOut()
        presenter?.userIsLoggedOut()
    }
    
    
    func isUserLoggedIn() {
        if AuthManager.shared.isUsedLoggedIn() {
            presenter?.userIsLoggedIn()
        } else {
            presenter?.userIsLoggedOut()
        }
    }
    
    
    func logInWith(viewController: UIViewController) {
        AuthManager.shared.login(viewController: viewController) { result in
            switch result {
                
            case .success:
                self.presenter?.userIsLoggedIn()
            case .failure:
                break
            }
        }
    }
    
    weak var presenter: ProfilePresenterProtocol?
}
