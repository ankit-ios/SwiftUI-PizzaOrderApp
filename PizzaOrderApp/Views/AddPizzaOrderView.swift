//
//  AddPizzaOrderView.swift
//  PizzaOrderApp
//
//  Created by Ankit Sharma on 07/09/23.
//

import SwiftUI

struct AddPizzaOrderView: View {
    
    @ObservedObject var createPizzaOrderVM = CreatePizzaOrderViewModel()
    @Binding var isPresented: Bool
    
    
    var body: some View {
        
        NavigationView {
            
            VStack() {
                //Form
                Form {
                    Section(header: Text("Information").font(.body)) {
                        TextField("Enter Name", text: self.$createPizzaOrderVM.name)
                    }
                    
                    Section(header: Text("Select Pizza").font(.body)) {
                        ForEach(self.createPizzaOrderVM.pizzaList, id: \.name) { pizza in
                            PizzaCellView(pizza: pizza, selection: self.$createPizzaOrderVM.pizzaName)
                        }
                    }
                    
                    Section(header: Text("Select Size").font(.body), footer: OrderTotalView(total: self.createPizzaOrderVM.total)) {
                        Picker("Select Size", selection: self.$createPizzaOrderVM.size) {
                            Text("Small").tag("Small")
                            Text("Medium").tag("Medium")
                            Text("Large").tag("Large")
                        }.pickerStyle(.segmented)
                    }
                }
                
                HStack {
                    Button("Place Order") {
                        print("order placed")
                        self.createPizzaOrderVM.placeOrder()
                        self.isPresented = false
                    }
                }
                .padding(.init(top: 12, leading: 100, bottom: 12, trailing: 100))
                .font(.title2)
                .foregroundColor(.white)
                .background(.green)
                .cornerRadius(10)
            }.navigationTitle("Add Order")
        }
    }
}

struct AddPizzaOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddPizzaOrderView(isPresented: .constant(false))
    }
}

