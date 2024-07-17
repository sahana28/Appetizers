//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Sahana  Rao on 08/01/24.
//

import SwiftUI

@main
struct AppetizersApp: App {
    var order = Order()
    var body: some Scene {
        WindowGroup {
            AppetizersTabView().environmentObject(order)
        }
    }
}
