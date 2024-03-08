//
//  UserInfoViewController.swift
//  Super easy dev
//
//  Created by Куат Оралбеков on 08.03.2024
//

import UIKit

protocol UserInfoViewProtocol: AnyObject {
    
    func showAlert()
    
    func showUserInfo(info: UserInfo)
    
}

class UserInfoViewController: UIViewController {
    
    private let nameLabel = UILabel()
    
    private let nameTextField = UITextField()
    
    private let phoneNumberLabel = UILabel()
    
    private let phoneNumberTextField = UITextField()
    
    private let cityLabel = UILabel()
    
    private let dropDown = CustomDropDown()
    
    private let streetLabel = UILabel()
    
    private let streetTextField = UITextField()
    
    private let homeLabel = UILabel()
    
    private let homeNumberTextField = UITextField()
    
    private let saveButton = UIButton()
    
    // MARK: - Public
    var presenter: UserInfoPresenterProtocol?

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        presenter?.viewDidLoaded()
        setupNavigationBar()
        setupNameLabel()
        setupNameTextField()
        setupPhoneNumberLabel()
        setupPhoneNumberTextField()
        setupCityLabel()
        setupDropDown()
        setupStreetLabel()
        setupStreetTextField()
        setupHomeLabel()
        setupHomeNumberTextField()
        setupSaveButton()
        setupConstraints()
    }
    
    private func setupNavigationBar() {
        
        view.backgroundColor = .white
        let backButton = UIBarButtonItem()
        backButton.title = "Profile"
        backButton.tintColor = .backgroundColor
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    private func setupSaveButton() {
        
        view.addSubview(saveButton)
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.backgroundColor = .backgroundColor
        saveButton.addTarget(self, action: #selector(save), for: .touchUpInside)
    }
    
    @objc private func save() {
        
        let userInfo = UserInfo(name: nameTextField.text ?? "",
                                phoneNumber: phoneNumberTextField.text ?? "",
                                city: cityLabel.text ?? "",
                                street: streetTextField.text ?? "",
                                homeNumber: homeNumberTextField.text ?? "")
        presenter?.saveButtonTapped(info: userInfo)
        
    }
    
    private func setupNameLabel() {
        
        view.addSubview(nameLabel)
        nameLabel.text = "Enter full name"
        nameLabel.font = UIFont(name: "Georgia-Bold", size: 22)
    }
    
    private func setupPhoneNumberLabel() {
        
        view.addSubview(phoneNumberLabel)
        phoneNumberLabel.text = "Enter your number"
        phoneNumberLabel.font = UIFont(name: "Georgia-Bold", size: 22)
    }
    
    private func setupPhoneNumberTextField() {
        
        view.addSubview(phoneNumberTextField)
        phoneNumberTextField.keyboardType = .numberPad
        phoneNumberTextField.font = UIFont(name: "Georgia-Bold", size: 20)
    }
    
    private func setupNameTextField() {
        nameTextField.font = UIFont(name: "Georgia-Bold", size: 20)
        view.addSubview(nameTextField)
    }
    
    private func setupCityLabel() {
        
        view.addSubview(cityLabel)
        cityLabel.font = UIFont(name: "Georgia-Bold", size: 22)
        cityLabel.textColor = .black
    }
    
    private func setupDropDown() {
        
        view.addSubview(dropDown)
        dropDown.didSelect{(selectedText , index ,id) in
        self.cityLabel.text = selectedText
            }
        
    }
    
    private func setupStreetLabel() {
        
        view.addSubview(streetLabel)
        streetLabel.font = UIFont(name: "Georgia-Bold", size: 22)
        streetLabel.textColor = .black
        streetLabel.text = "Choose your street"
    }
    
    private func setupStreetTextField() {
        
        view.addSubview(streetTextField)
        streetTextField.font = UIFont(name: "Georgia-Bold", size: 20)
    }
    
    private func setupHomeLabel() {
        
        view.addSubview(homeLabel)
        homeLabel.font = UIFont(name: "Georgia-Bold", size: 22)
        homeLabel.textColor = .black
        homeLabel.text = "Choose home number"
    }
    
    private func setupHomeNumberTextField() {
        
        view.addSubview(homeNumberTextField)

        homeNumberTextField.font = UIFont(name: "Georgia-Bold", size: 20)
    }
    
    private func setupConstraints() {
        
        
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(10)
        }

        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.width.equalToSuperview()
        }
        
        phoneNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.width.equalToSuperview()
        }
        
        phoneNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.width.equalToSuperview()
        }
        
        cityLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberTextField.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(10)
        }
        
        dropDown.snp.makeConstraints { make in
            make.top.equalTo(cityLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.width.equalToSuperview().multipliedBy(0.5)
            
        }
        
        streetLabel.snp.makeConstraints { make in
            make.top.equalTo(dropDown.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        streetTextField.snp.makeConstraints { make in
            make.top.equalTo(streetLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.width.equalToSuperview()
        }
        
        homeLabel.snp.makeConstraints { make in
            make.top.equalTo(streetTextField.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        homeNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(homeLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.width.equalToSuperview()
        }
        
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(homeNumberTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
        }

    }
}

// MARK: - Private functions
private extension UserInfoViewController {
    func initialize() {
    }
}

// MARK: - UserInfoViewProtocol
extension UserInfoViewController: UserInfoViewProtocol {
    
    func showUserInfo(info: UserInfo) {
        nameTextField.text = info.name
        phoneNumberTextField.text = info.phoneNumber
        cityLabel.text = info.city
        streetTextField.text = info.street
        homeNumberTextField.text = info.homeNumber
    }
    
    
    
    func showAlert() {
        let alertController = UIAlertController(title: "Ooops!", message: "Fill all fields", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
    
}
