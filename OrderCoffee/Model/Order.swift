//
//  Coffee.swift
//  OrderCoffee
//
//  Created by Piyush Vaish on 25/06/19.
//  Copyright © 2019 Piyush Vaish. All rights reserved.
//

import Foundation

enum CoffeeType : String,Codable{
    case cappucino
    case espresso
    case latte
}

enum CoffeeSize : String,Codable{
    case small
    case medium
    case large
}

struct Order : Codable{
    let name:String
    let email:String
    let type:CoffeeType
    let size:CoffeeSize
}
