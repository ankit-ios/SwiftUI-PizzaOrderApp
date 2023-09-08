//
//  PizzaViewModel.swift
//  PizzaOrderApp
//
//  Created by Ankit Sharma on 07/09/23.
//

import Foundation

struct PizzaListViewModel {
    let list: [PizzaViewModel] = Pizza.all().map(PizzaViewModel.init)
}

struct PizzaViewModel {
    
    let pizza: Pizza
    
    init(pizza: Pizza) {
        self.pizza = pizza
    }
    
    var name: String { pizza.name }
    var imageUrl: String { pizza.imageUrl }
    var price: Double { pizza.price }
}
