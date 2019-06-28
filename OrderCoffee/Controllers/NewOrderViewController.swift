//
//  NewOrderViewController.swift
//  OrderCoffee
//
//  Created by Piyush Vaish on 25/06/19.
//  Copyright © 2019 Piyush Vaish. All rights reserved.
//

import Foundation
import UIKit

class NewOrderViewController:UIViewController{
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    var addCoffeeOrderViewModel = AddCoffeeOrderViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentControl.removeAllSegments()
        setupSegmentControl()
    }
    private func setupSegmentControl(){
        var counter = 0
        for segment in addCoffeeOrderViewModel.size{
            segmentControl.insertSegment(withTitle: segment, at: counter, animated: false)
            counter += 1
        }
    }
    @IBAction func btnSaveClicked(_ sender: UIBarButtonItem) {
        let name = self.nameTextField.text
        let email = self.emailTextField.text
        let selectedSize = segmentControl.titleForSegment(at: segmentControl.selectedSegmentIndex)
        guard let indexPath = self.tblView.indexPathForSelectedRow else{
            return
        }
        addCoffeeOrderViewModel.name = name
        addCoffeeOrderViewModel.email = email
        addCoffeeOrderViewModel.selectedType = addCoffeeOrderViewModel.types[indexPath.row]
        addCoffeeOrderViewModel.selectedSize = selectedSize
        
        // We need to set these View Model Values in the Order Model.
        
        Webservice().load(resource: Order.create(vm: addCoffeeOrderViewModel)) { (result) in
            switch result {
            case .success(let order):
                print(order)
            case .failure(let error):
                print(error)
            }
        }
      
    }
}

extension NewOrderViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addCoffeeOrderViewModel.types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeTypeTableViewCell") else{
            return UITableViewCell()
        }
        cell.textLabel?.text = addCoffeeOrderViewModel.types[indexPath.row]
        return cell
    }
}

extension NewOrderViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let _ = addCoffeeOrderViewModel.types[indexPath.row]
        guard let cell = tableView.cellForRow(at: indexPath) else{
            return
        }
        cell.accessoryType = .checkmark
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else{
            return
        }
        cell.accessoryType = .none
    }
}
