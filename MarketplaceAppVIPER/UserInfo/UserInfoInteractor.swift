//
//  UserInfoInteractor.swift
//  Super easy dev
//
//  Created by Куат Оралбеков on 08.03.2024
//

import Foundation

protocol UserInfoInteractorProtocol: AnyObject {
    
    func saveUserInfo(info: UserInfo)
    
    func loadUserInfo()
}

class UserInfoInteractor: UserInfoInteractorProtocol {
    
    func loadUserInfo() {
        let userDefaults = UserDefaults.standard
        let city = userDefaults.object(forKey: "city") as? String ?? ""
        let name = userDefaults.object(forKey: "name") as? String ?? ""
        let street = userDefaults.object(forKey: "street") as? String ?? ""
        let homeNumber = userDefaults.object(forKey: "homeNumber") as? String ?? ""
        let phoneNumber = userDefaults.object(forKey: "phone") as? String ?? ""
        let userInfo = UserInfo(name: name,
                                phoneNumber: phoneNumber,
                                city: city,
                                street: street,
                                homeNumber: homeNumber)
        presenter?.userInfoWasLoaded(info: userInfo)
    }
    
    
    func saveUserInfo(info: UserInfo) {
        guard info.street != "",
              info.name != "",
              info.city != "",
              info.phoneNumber != "",
              info.homeNumber != "" else { presenter?.userInfoError(); return }
        let userDefaults = UserDefaults.standard
        userDefaults.set(info.name, forKey: "name")
        userDefaults.set(info.city, forKey: "city")
        userDefaults.set(info.street, forKey: "street")
        userDefaults.set(info.homeNumber, forKey: "homeNumber")
        userDefaults.set(info.phoneNumber, forKey: "phone")
        presenter?.userInfoWasSaved()
    }
    
    weak var presenter: UserInfoPresenterProtocol?
}
