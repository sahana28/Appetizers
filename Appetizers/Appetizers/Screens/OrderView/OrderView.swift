//
//  OrderView.swift
//  Appetizers
//
//  Created by Sahana  Rao on 08/01/24.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order : Order
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemBackground)
                VStack {
                    List {
                        ForEach(order.items) { orders in
                            AppetizerListCell(appetizer: orders)
                        }
                        .onDelete { indexSet in
                            order.items.remove(atOffsets: indexSet)
                        }
                    }
                    .listStyle(PlainListStyle())
                    
                    Button {
                        
                    } label: {
                       // APButton(title: "$\(order.price) - Place order" )
                        Text("$\(order.price, specifier: "%.2f") - Place order")
                    }
                    .modifier(StandardButtonStyle())
                    .padding(.bottom, 25)
                }
                if order.items.isEmpty {
                    EmptyOrdersView(imageName: "empty-order",
                                    message: "You have no items in your order.\n Please add an appetizers!")
                }
            }
            .navigationTitle("🧾 Orders")
            
        }
        
    }
    
    
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
