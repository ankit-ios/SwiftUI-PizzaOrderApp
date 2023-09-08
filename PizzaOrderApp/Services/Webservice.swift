//
//  Webservice.swift
//  PizzaOrderApp
//
//  Created by Ankit Sharma on 07/09/23.
//

import Foundation

struct Webservice {
    
    func getAllOrders(completion: @escaping (([Order]?) -> ())) {
        
        let urlString = "https://fluoridated-checkered-song.glitch.me/orders"
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        print(#function)
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            if let orders = try? JSONDecoder().decode([Order].self, from: data) {
                DispatchQueue.main.async {
                    print(orders)
                    completion(orders)
                }
            }
        }.resume()
    }
    
    func createOrder(order: Order, completion: @escaping ((CreateOrderResponse?) -> ())) {
        
        let urlString = "https://fluoridated-checkered-song.glitch.me/orders"
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        print(#function)
        print(order)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = try? JSONEncoder().encode(order)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    print(error?.localizedDescription)
                    completion(nil)
                }
                return
            }
            
            do{
                let response = try JSONDecoder().decode(CreateOrderResponse.self, from: data)
                DispatchQueue.main.async {
                    print(response)
                    completion(response)
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
