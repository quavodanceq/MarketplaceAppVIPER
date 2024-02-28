//
//  MainInteractor.swift
//  Super easy dev
//
//  Created by Куат Оралбеков on 26.02.2024
//

protocol MainInteractorProtocol: AnyObject {
}

class MainInteractor: MainInteractorProtocol {
    weak var presenter: MainPresenterProtocol?
}
