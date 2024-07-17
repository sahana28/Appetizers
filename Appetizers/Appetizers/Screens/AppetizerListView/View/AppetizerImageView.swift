//
//  AppetizerImageView.swift
//  Appetizers
//
//  Created by Sahana  Rao on 11/01/24.
//

import SwiftUI

struct AppetizerSubDetailsView: View {
    let appetizer : Appetizers
    var body: some View {
        VStack {
            Text(appetizer.name)
                .font(.title2)
                .fontWeight(.semibold)
            Text(appetizer.description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
            
            HStack(spacing:30) {
                NutritionDetailView(titleText: "Calories", valueText: "\(appetizer.calories)")
                NutritionDetailView(titleText: "Carbs", valueText: "\(appetizer.carbs) g")
                NutritionDetailView(titleText: "Protein", valueText: "\(appetizer.carbs) g")
            }
        }
    }
}

struct AppetizerSubDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerSubDetailsView(appetizer: MockData.sampleAppetizer)
    }
}
