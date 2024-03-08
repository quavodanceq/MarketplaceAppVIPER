//
//  DropDown + Extension.swift
//  MarketplaceAppVIPER
//
//  Created by Куат Оралбеков on 08.03.2024.
//

import Foundation
import iOSDropDown
import UIKit

class CustomDropDown: DropDown {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.optionArray = ["Aktau", "Aktobe", "Almaty", "Arkalyk", "Astana", "Atyrau", "Baikonur", "Balqash", "Jezkazgan", "Karaganda", "Kentau", "Kyzylorda", "Kokshetau", "Kostanay", "Janaozen", "Pavlodar", "Petropavl", "Ridder", "Saran", "Satpayev", "Semey", "Stepnogorsk", "Taldykorgan", "Taraz", "Temirtau", "Turkistan", "Oral", "Oskemen", "Shymkent", "Shakhtinsk", "Schuchinsk", "Ekibastuz"]
        self.selectedRowColor = .backgroundColor
        self.placeholder = "Choose your city"
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
