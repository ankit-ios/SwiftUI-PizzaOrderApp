//
//  Order.swift
//  PizzaOrderApp
//
//  Created by Ankit Sharma on 07/09/23.
//

import Foundation

struct Order: Codable {
    let name: String
    let pizzaName: String
    let total: Double
    let size: String
}
