//
//  OrderListView.swift
//  PizzaOrderApp
//
//  Created by Ankit Sharma on 07/09/23.
//

import SwiftUI

struct OrderListView: View {
    
    var orders: [OrderViewModel]
    
    init(orders: [OrderViewModel]) {
        self.orders = orders
    }
    
    var body: some View {
        List {
            ForEach(orders, id: \.id) { order in
                HStack(spacing: 20) {
                    Image(order.pizzaName).resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(20)
                    VStack(alignment: .leading, spacing: 6) {
                        Text(order.name)
                            .font(.largeTitle)
                        Text(order.pizzaName)
                            .padding(.init(top: 4, leading: 4, bottom: 4, trailing: 4))
                            .foregroundColor(.white)
                            .background(.gray)
                            .font(.body)
                            .cornerRadius(10)
                        Text(order.size)
                            .padding(.init(top: 4, leading: 4, bottom: 4, trailing: 4))
                            .foregroundColor(.white)
                            .background(.blue)
                            .font(.body)
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(orders: [.init(order: .init(name: "Ankit", pizzaName: "Cheesy Vegetable Pizza", total: 324, size: "Regular"))])
    }
}
