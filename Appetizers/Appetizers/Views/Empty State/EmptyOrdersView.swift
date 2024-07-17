//
//  EmptyOrdersView.swift
//  Appetizers
//
//  Created by Sahana  Rao on 13/01/24.
//

import SwiftUI

struct EmptyOrdersView: View {
    let imageName : String
    let message : String
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 120)
                Text(message)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
            .offset(y: -50)
        }
        
    }
}

struct EmptyOrdersView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyOrdersView(imageName: "empty-order", message: "You have no items in your order")
    }
}
