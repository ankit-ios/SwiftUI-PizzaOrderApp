//
//  ContentView.swift
//  PizzaOrderApp
//
//  Created by Ankit Sharma on 07/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var orderListViewModel: OrderListViewModel
    @State var showAddOrderModel: Bool = false
    
    init() {
        orderListViewModel = OrderListViewModel()
    }
    
    var body: some View {
        
        //TODO: Change navigation bar color
        NavigationView {
            OrderListView(orders: orderListViewModel.orders)
                .navigationTitle("Pizza Orders")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: reloadOrders) {
                            Image(systemName: "arrow.clockwise")
//                                .foregroundColor(Color.white)
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: createNewOrder) {
                            Image(systemName: "plus")
//                                .foregroundColor(Color.white)
                        }
                    }
                }
                .sheet(isPresented: self.$showAddOrderModel) {
                    AddPizzaOrderView(isPresented: self.$showAddOrderModel)
                }
        }
    }
    
    private func reloadOrders() {
        self.orderListViewModel.fetchOrder()
    }
    
    private func createNewOrder() {
        showAddOrderModel = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
