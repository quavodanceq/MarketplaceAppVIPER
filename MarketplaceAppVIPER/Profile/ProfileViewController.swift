//
//  ProfileViewController.swift
//  Super easy dev
//
//  Created by Куат Оралбеков on 02.03.2024
//

import UIKit
import GoogleSignIn
import SnapKit

protocol ProfileViewProtocol: AnyObject {
    
    func showUserInfo()
    
    func showLogInButton()
    
}

class ProfileViewController: UIViewController {
    // MARK: - Public
    var presenter: ProfilePresenterProtocol?
    
    private let loginButton = GIDSignInButton()
    
    private let infoButton = CustomButton()
    
    private let ordersButton = CustomButton()
    
    private let logOutButton = CustomButton()

    // MARK: - View lifecycle
    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        initialize()
        presenter?.viewDidloaded()
        setupLoginButton()
        setupInfoButton()
        setupOrdersButton()
        setupLogOutButton()
        setupConstaints()
    }
    
    
    private func setupLoginButton() {
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        view.addSubview(loginButton)
    }
    
    private func setupLogOutButton() {
        
        view.addSubview(logOutButton)
        logOutButton.setTitleColor(.white, for: .normal)
        logOutButton.addTarget(self, action: #selector(logOutButtonTapped), for: .touchUpInside)
        logOutButton.setTitle("Log out", for: .normal)
        logOutButton.backgroundColor = .backgroundColor
    }
    
    private func setupOrdersButton() {
        
        view.addSubview(ordersButton)
        ordersButton.setTitle("Orders", for: .normal)
        ordersButton.addTarget(self, action: #selector(ordersButtonTapped), for: .touchUpInside)
    }
    
    private func setupInfoButton() {
        
        view.addSubview(infoButton)
        infoButton.setTitle("Private information", for: .normal)
        infoButton.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)
    }
    
    private func setupConstaints() {
        
        
        loginButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.centerX.equalToSuperview()
        }
        
        infoButton.snp.makeConstraints { make in
            
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50)
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        ordersButton.snp.makeConstraints { make in
            make.top.equalTo(infoButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        logOutButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.centerX.equalToSuperview()
        }
        
        
    }
    
    @objc private func loginButtonTapped(_ sender: UIButton) {
        
        sender.pulsate()
        
        sender.flash()
        
        presenter?.logInButtonTapped()
        
    
    }
    
    @objc private func ordersButtonTapped(_ sender: UIButton) {
        
        sender.pulsate()
        
        sender.flash()
        
        presenter?.ordersButtonTapped()
    }
    
    @objc private func infoButtonTapped(_ sender: UIButton) {
        
        sender.pulsate()
        
        sender.flash()
        
    }
    
    @objc private func logOutButtonTapped(_ sender: UIButton) {
        
        sender.pulsate()
        
        sender.flash()
        
        presenter?.logOutButtonTapped()
    }
}

// MARK: - Private functions
private extension ProfileViewController {
    func initialize() {
    }
}

// MARK: - ProfileViewProtocol
extension ProfileViewController: ProfileViewProtocol {
    
    func showUserInfo() {
        self.loginButton.isHidden = true
        self.infoButton.isHidden = false
        self.ordersButton.isHidden = false
        self.logOutButton.isHidden = false

    }
    
    func showLogInButton() {
        self.loginButton.isHidden = false
        self.infoButton.isHidden = true
        self.ordersButton.isHidden = true
        self.logOutButton.isHidden = true
    }
    
}
