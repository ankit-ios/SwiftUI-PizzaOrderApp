//
//  OrderListViewModel.swift
//  PizzaOrderApp
//
//  Created by Ankit Sharma on 07/09/23.
//

import Foundation
import Combine


class OrderListViewModel: ObservableObject {
    
    @Published var orders: [OrderViewModel] = []
    let webservice: Webservice!
    
    
    init() {
        webservice = Webservice()
        fetchOrder()
    }
    
    func fetchOrder() {
        webservice.getAllOrders { [weak self] orders in
            if let orders = orders {
                self?.orders = orders.map (OrderViewModel.init)
            }
        }
    }
}


struct OrderViewModel {
    
    let id = UUID()
    var order: Order
    
    init(order: Order) {
        self.order = order
    }
    
    var name: String {
        order.name
    }
    var pizzaName: String {
        order.pizzaName
    }
    var total: Double {
        order.total
    }
    var size: String {
        order.size
    }
}
