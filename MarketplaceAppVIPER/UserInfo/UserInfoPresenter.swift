//
//  UserInfoPresenter.swift
//  Super easy dev
//
//  Created by Куат Оралбеков on 08.03.2024
//

protocol UserInfoPresenterProtocol: AnyObject {
    
    func viewDidLoaded()
    
    func saveButtonTapped(info: UserInfo)
    
    func userInfoError()
    
    func userInfoWasSaved()
    
    func userInfoWasLoaded(info: UserInfo)
    
}

class UserInfoPresenter {
    weak var view: UserInfoViewProtocol?
    var router: UserInfoRouterProtocol
    var interactor: UserInfoInteractorProtocol

    init(interactor: UserInfoInteractorProtocol, router: UserInfoRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension UserInfoPresenter: UserInfoPresenterProtocol {
    
    func userInfoWasLoaded(info: UserInfo) {
        view?.showUserInfo(info: info)
    }
    
    
    func userInfoWasSaved() {
        router.pop()
    }
    
    
    func userInfoError() {
        view?.showAlert()
    }
    
    
    func saveButtonTapped(info: UserInfo) {
        interactor.saveUserInfo(info: info)
    }
    
    
   
    
    func viewDidLoaded() {
        interactor.loadUserInfo()
    }
    
}
