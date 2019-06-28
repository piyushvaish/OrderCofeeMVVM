//
//  OrderViewModel.swift
//  OrderCoffee
//
//  Created by Piyush Vaish on 26/06/19.
//  Copyright © 2019 Piyush Vaish. All rights reserved.
//

import Foundation

class OrderListViewModel{
    var orderViewModel : [OrderViewModel]
    init() {
        self.orderViewModel = [OrderViewModel]()
    }
}

extension OrderListViewModel{
    func orderViewModel (at index: Int) ->OrderViewModel{
        return self.orderViewModel[index]
    }
}

struct OrderViewModel{
    
    var order : Order
    init(order:Order) {
        self.order = order
    }
    
}

extension OrderViewModel{
    var name : String{
        return self.order.name
    }
    var email : String{
        return self.order.email
    }
    var type : String{
        return self.order.type.rawValue.capitalized
    }
    var size : String{
        return self.order.size.rawValue.capitalized
    }
}
