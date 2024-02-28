//
//  MainPresenter.swift
//  Super easy dev
//
//  Created by Куат Оралбеков on 26.02.2024
//

protocol MainPresenterProtocol: AnyObject {
}

class MainPresenter {
    weak var view: MainViewProtocol?
    var router: MainRouterProtocol
    var interactor: MainInteractorProtocol

    init(interactor: MainInteractorProtocol, router: MainRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension MainPresenter: MainPresenterProtocol {
}
