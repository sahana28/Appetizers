//
//  AppetizersViewModel.swift
//  Appetizers
//
//  Created by Sahana  Rao on 09/01/24.
//

import Foundation
import SwiftUI

@MainActor class AppetizersViewModel : ObservableObject {
    
    @Published var appetizers : [Appetizers] = []
    @Published var shouldShowErrorAlert : Bool = false
    @Published var alertError : APError? = nil
    @Published var isLoading : Bool = false
    @Published var isShowingDetailView = false
    @Published var selectedAppetizer : Appetizers?
    
//    func getAppetizers() {
//        isLoading = true
//        NetworkManager.shared.getAppetizers { result in
//            DispatchQueue.main.async { [self] in
//                isLoading = false
//                switch result {
//                case .success(let appetizerList) :
//                    self.shouldShowErrorAlert = false
//                    self.appetizers = appetizerList
//                    break
//                case .failure(let error):
//                    self.shouldShowErrorAlert = true
//                    self.alertError = error
//                    print("Error : ", error.localizedDescription)
//                    break
//                }
//            }
//        }
//    }
    
    func getAppetizers() {
        isLoading = true
        Task {
            do {
                self.appetizers = try await NetworkManager.shared.getAppetizers()
                self.shouldShowErrorAlert = false
                isLoading = false
            } catch {
               // if let aperror = error as? APError {
                    isLoading = false
                    self.shouldShowErrorAlert = true
                   // self.alertError = aperror
                self.alertError = APError.invalidResponse
               // }
                
                
            }
        }
        
    }
    
    
    
}
