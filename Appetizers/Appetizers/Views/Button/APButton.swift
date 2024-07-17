//
//  APButton.swift
//  Appetizers
//
//  Created by Sahana  Rao on 13/01/24.
//

import SwiftUI

struct APButton: View {
    var title : String
    var body: some View {
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .frame(width: 260, height: 50)
                .background(Color.brandColor)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.bottom,20)
        }
}

struct APButton_Previews: PreviewProvider {
    static var previews: some View {
        APButton(title: "Title")
    }
}

extension View {
    func standardButtonStyle() -> some View  {
        self.modifier(StandardButtonStyle())
    }
}
