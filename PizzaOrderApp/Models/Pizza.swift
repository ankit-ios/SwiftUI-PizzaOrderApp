//
//  Pizza.swift
//  PizzaOrderApp
//
//  Created by Ankit Sharma on 07/09/23.
//

import Foundation

struct Pizza {
    
    let name: String
    let imageUrl: String
    let price: Double
}

extension Pizza {
    
    static func all() -> [Pizza] {
        return [
            .init(name: "Cheesy Vegetable Pizza", imageUrl: "Cheesy Vegetable Pizza", price: 615),
            .init(name: "Bread Pizza", imageUrl: "Bread Pizza", price: 245),
            .init(name: "Tandoori Paneer Pizza", imageUrl: "Tandoori Paneer Pizza", price: 435),
            .init(name: "Uttapam Pizza", imageUrl: "Uttapam Pizza", price: 360)
        ]
    }
}
