//
//  WebServices.swift
//  OrderCoffee
//
//  Created by Piyush Vaish on 25/06/19.
//  Copyright © 2019 Piyush Vaish. All rights reserved.
//

import Foundation

struct Resource: Codable{
    func loadData(url:URL,completion:@escaping ((Coffee?)->())){
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else{
                completion(nil)
                return
            }
            let result = try? JSONDecoder().decode(Coffee.self, from: data)
            if let result = result {
                completion(result)
            }else{
                completion(nil)
            }
        }.resume()
    }
}
