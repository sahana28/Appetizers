//
//  Order.swift
//  Appetizers
//
//  Created by Sahana  Rao on 13/01/24.
//

import SwiftUI

final class Order : ObservableObject {
    @Published var items : [Appetizers] = []
    
    var price : Double {
       items.reduce(0) {$0 + $1.price}
    }
    
    func addOrderItems(_ appetizers: Appetizers) {
        items.append(appetizers)
    }
    
    func deleteItems(at offsets:IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
}
