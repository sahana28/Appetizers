//
//  ContentView.swift
//  Appetizers
//
//  Created by Sahana  Rao on 08/01/24.
//

import SwiftUI

struct AppetizersTabView: View {
    @EnvironmentObject var order : Order
    
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
            
            OrderView()
                .tabItem {
                    Label("Orders", systemImage: "bag")
                    
                    
                }
                .badge(order.items.count)
            
        }
        //.accentColor(Color.brandColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersTabView()
    }
}
