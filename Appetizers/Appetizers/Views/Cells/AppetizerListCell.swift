//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by Sahana  Rao on 09/01/24.
//

import SwiftUI

struct AppetizerListCell: View {
    var appetizer : Appetizers
    var body: some View {
        HStack() {
//            RemoteImageLoader(imageUrl: appetizer.imageURL)
//                .aspectRatio(contentMode: .fill)
//                .frame(width: 120, height: 90)
//                .cornerRadius(8)
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:120, height:90)
                    .cornerRadius(8)
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:120, height:90)
                    .cornerRadius(8)
                
            }

            
            VStack(alignment: .leading, spacing:5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text(String(format: "$ %.2f", appetizer.price))
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            
        }
        
        
        
    }
}

struct AppetizerListCell_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListCell(appetizer: MockData.sampleAppetizer)
    }
}
