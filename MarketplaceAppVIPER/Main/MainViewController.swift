//
//  MainViewController.swift
//  Super easy dev
//
//  Created by Куат Оралбеков on 26.02.2024
//

import UIKit

protocol MainViewProtocol: AnyObject {
}

class MainViewController: UITabBarController {
    // MARK: - Public
    var presenter: MainPresenterProtocol?

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

// MARK: - Private functions
private extension MainViewController {
    func initialize() {
    }
}

// MARK: - MainViewProtocol
extension MainViewController: MainViewProtocol {
}
