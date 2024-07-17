//
//  ActivityIndicator.swift
//  Appetizers
//
//  Created by Sahana  Rao on 10/01/24.
//

import Foundation
import SwiftUI

struct ActivityIndicator : UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityViewController = UIActivityIndicatorView(style: .large)
        activityViewController.color = UIColor.brandColor
        activityViewController.startAnimating()
        return activityViewController
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {

    }

}


struct LoadingView : View {
    var body : some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
//            ProgressView("Loading...")
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .brandColor))
                .scaleEffect(2)
           // ActivityIndicator()
        }
        
    }
}
