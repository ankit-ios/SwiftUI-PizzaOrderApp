//
//  OrderTotalView.swift
//  PizzaOrderApp
//
//  Created by Ankit Sharma on 07/09/23.
//

import SwiftUI

struct OrderTotalView: View {
    let total: Double
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Text("Total:").font(.title)
            Text(String(format: "$%.2f", total))
                .font(.title)
                .foregroundColor(.green)
            Spacer()
        }
        .padding(10)
    }
}

struct OrderTotalView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTotalView(total: 10.56)
    }
}
