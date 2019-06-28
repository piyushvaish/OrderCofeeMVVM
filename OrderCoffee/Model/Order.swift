//
//  Coffee.swift
//  OrderCoffee
//
//  Created by Piyush Vaish on 25/06/19.
//  Copyright © 2019 Piyush Vaish. All rights reserved.
//

import Foundation

enum CoffeeType : String,Codable,CaseIterable{
    case cappuccino
    case espresso
    case latte
    case cortado
}

enum CoffeeSize : String,Codable,CaseIterable{
    case small
    case medium
    case large
}

// Chose struct for a model since it contains all the value types and no reference types. Dont intend to do any inheritance. Change in one place wont reflect in other places as compared to using classs.
struct Order : Codable{
    let name:String
    let email:String
    let type:CoffeeType
    let size:CoffeeSize
}
extension Order {
    static func create(vm:AddCoffeeOrderViewModel) -> Resource<Order?>{
        
        let order = Order(vm: vm)
        guard let url = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders") else{
            fatalError()
        }
        
        guard let data = try? JSONEncoder().encode(order) else{
            fatalError()
        }
        var resource = Resource<Order?>(url: url)
        resource.httpMethod = HttpMethod.post
        resource.body = data
        return resource
    }
}
extension Order{
    init?(vm:AddCoffeeOrderViewModel) {
        guard let name = vm.name,
        let email = vm.email,
        let type = CoffeeType(rawValue:vm.selectedType!.lowercased()),
        let size = CoffeeSize(rawValue:vm.selectedSize!.lowercased()) else{
                return nil
        }
        self.name = name
        self.email = email
        self.type = type
        self.size = size
    }
}
