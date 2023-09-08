//
//  PizzaCellView.swift
//  PizzaOrderApp
//
//  Created by Ankit Sharma on 08/09/23.
//

import SwiftUI

struct PizzaCellView: View {
    
    let pizza: PizzaViewModel
    @Binding var selection: String
    
    var body: some View {
        HStack {
            Image(pizza.imageUrl)
                .resizable()
                .frame(width: 80, height: 80)
                .cornerRadius(20)
            Text(pizza.name)
                .font(.body)
                .padding([.leading], 20)
            Spacer()
            Image(systemName: self.selection == pizza.name ? "checkmark" : "")
        }
        .padding(10)
        .onTapGesture {
            self.selection = pizza.name
        }
    }
}

struct PizzaCellView1: View {
        
    var body: some View {
        NavigationView {
            HStack {
                Image("Cheesy Vegetable Pizza")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(20)
                Text("Cheesy Vegetable Pizza")
                    .font(.body)
                    .padding([.leading], 20)
            }
        }
    }
}


#if DEBUG
struct PizzaCellView1_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            PizzaCellView1()
                .previewLayout(.sizeThatFits) // layout changes
            PizzaCellView1()
                .environment(\.sizeCategory, .extraExtraExtraLarge) //dynamic fonts
            PizzaCellView1()
                .colorScheme(.dark) // dark mode
            PizzaCellView1()
                .previewDevice("iPhone SE") //preview on different devices
        }
    }
}

#endif
