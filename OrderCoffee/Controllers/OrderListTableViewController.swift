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
    
    var orderListViewModel = OrderListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        populateOrders()
      
    }
    private func populateOrders(){
        //chose guard here because I do not want to do anything if the url is nil. It will return from the function. Whereas in case of if let, I can do rest of the things even if the url fails by writing the code after the if let block.
        guard let coffeeOrderURL = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders") else{
            return
        }
        let resource = Resource<[Order]>(url: coffeeOrderURL)
        Webservice().load(resource: resource) {[weak self] (result) in
            switch result{
                case .success(let orders):
                    print(orders)
                    self?.orderListViewModel.orderViewModel = orders.map({ (order) in
                        OrderViewModel(order: order)
                    })
                    // Since I am receiving result in the main thread hence my reloading is onto the main thread only.
                    self?.tableView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
}
extension OrderListTableViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderListViewModel.orderViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let vm = self.orderListViewModel.orderViewModel(at: indexPath.row)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell") else{
            return UITableViewCell()
        }
        cell.textLabel?.text = vm.type
        cell.detailTextLabel?.text = vm.size
        return cell
    }
}

