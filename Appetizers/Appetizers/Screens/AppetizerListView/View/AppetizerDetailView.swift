//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Sahana  Rao on 10/01/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    @Binding var isShowingDetailView : Bool
    @EnvironmentObject var order : Order
    
    let appetizer : Appetizers
    var body: some View {
        VStack {
                RemoteImageLoader(imageUrl: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width:300, height: 225)
            
            AppetizerSubDetailsView(appetizer: appetizer)
            
            Spacer()
            
            Button {
                order.addOrderItems(appetizer)
            } label: {
               // APButton(title: "$\(appetizer.price) - Add to order")
                Text("$\(appetizer.price, specifier: "%.2f") - Add to order")
            }
//            .buttonStyle(.bordered)
//            .tint(.brandColor)
//            .controlSize(.large)
            .modifier(StandardButtonStyle())
            .padding(.bottom, 30)
            
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetailView = false
        } label: {
            XDismissButton()
        }, alignment: .topTrailing)
        
    }
}
    

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(isShowingDetailView: .constant(false), appetizer: MockData.sampleAppetizer)
    }
}


struct NutritionDetailView : View {
    var titleText : String
    var valueText : String
    
    var body: some View {
        VStack(spacing:5) {
            Text(titleText)
                .bold()
                .font(.caption)
            Text(valueText)
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}


