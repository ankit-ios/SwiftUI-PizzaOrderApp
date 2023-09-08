//
//  CreatePizzaOrderViewModel.swift
//  PizzaOrderApp
//
//  Created by Ankit Sharma on 07/09/23.
//

import Foundation

class CreatePizzaOrderViewModel: ObservableObject {
    
    let webservice: Webservice!
    var name: String = ""
    @Published var pizzaName: String = ""
    @Published var size: String = "Medium"
    
    
    init() {
        self.webservice = Webservice()
    }
    
    
    var pizzaList: [PizzaViewModel] {
        return PizzaListViewModel().list
    }
    
    var total: Double {
        calculateTotalPrice()
    }
    
    func placeOrder() {
        let order = Order.init(name: name, pizzaName: pizzaName, total: self.total, size: size)
        webservice.createOrder(order: order) { response in
            print(response)
        }
    }
    
    private func priceForSize() -> Double {
        let sizes = ["Small" : 2.0, "Medium" : 3.0, "Large" : 4.0]
        return sizes[size] ?? 0.0
    }
    
    private func calculateTotalPrice() -> Double {
        if let pizzaVM = pizzaList.first(where: {$0.name == pizzaName}) {
            return pizzaVM.price * priceForSize()
        } else {
            return 0.0
        }
    }
}
