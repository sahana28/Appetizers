//
//  RemoteImageLoader.swift
//  Appetizers
//
//  Created by Sahana  Rao on 10/01/24.
//

import UIKit
import SwiftUI


class ImageLoader : ObservableObject {
   @Published var image : Image? = nil
    
    func loadImage(fromURLString urlString: String) {
        NetworkManager.shared.downloadImages(fromURLString: urlString) { uiImage in
            guard let uiImage = uiImage else {
                return
            }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
    
}

struct RemoteImage : View {
    var image : Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
        
    }
}


struct RemoteImageLoader : View {
    
    @StateObject var imageLoader = ImageLoader()
    let imageUrl : String
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {
                imageLoader.loadImage(fromURLString: imageUrl)
            }
    }
    
}
