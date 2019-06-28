//
//  AddCoffeeOrderViewModel.swift
//  OrderCoffee
//
//  Created by Piyush Vaish on 28/06/19.
//  Copyright © 2019 Piyush Vaish. All rights reserved.
//

import Foundation

struct AddCoffeeOrderViewModel{
    
    var name: String?
    var email:String?
    
    var selectedSize: String?
    var selectedType: String?
    
    var types: [String] {
        return CoffeeType.allCases.map{ $0.rawValue.capitalized }
    }
    var size: [String] {
        return CoffeeSize.allCases.map{ $0.rawValue.capitalized }
    }
}
