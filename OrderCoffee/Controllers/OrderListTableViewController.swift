//
//  OrderListTableViewController.swift
//  OrderCoffee
//
//  Created by Piyush Vaish on 25/06/19.
//  Copyright © 2019 Piyush Vaish. All rights reserved.
//

import Foundation
import UIKit

class OrderListTableViewController:UITableViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        populateOrders()
    }
    private func populateOrders(){
        //chose guard here because I do not want to do anything if the url is nil. It will return from the function. Whereas in case of if let, I can do rest of the things even if the url fails by writing the code after the if let block.
        guard let coffeeOrderURL = URL(string: "https://guarded-retreat-82533.herokuapp.com") else{
            return
        }
        Resource().loadData(url: coffeeOrderURL) { (order) in
            
        }
    }
}
