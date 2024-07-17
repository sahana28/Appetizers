//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Sahana  Rao on 11/01/24.
//

import Foundation
import SwiftUI


class AccountViewModel : ObservableObject {
    
    @AppStorage("user") private var userData : Data?
    @Published var user = User()
    @Published var error : APError?
    @Published var showError = false
    @Published var appetizersOrderList : [Appetizers] = []
    
    func saveChanges() {
        guard isValidForm else {
            return
        }
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            showError = true
            self.error = APError.userSaveSuccess
        } catch {
            showError = true
            self.error = APError.userSaveFailure
        }
        
    }
    
    func retrieveChanges()  {
        guard let savedData = userData else { return  }
        
        do {
            let data = try JSONDecoder().decode(User.self, from: savedData)
            user = data
            
        }
        catch {
            showError = true
            self.error = APError.userSaveFailure
        }
    }
    
    func addAppetizersForOrder(appetizers:Appetizers) {
        self.appetizersOrderList.append(appetizers)
    }
    
    
    var isValidForm : Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            showError = true
            error = APError.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            showError = true
            error = APError.invalidEmail
            return false
        }
        
        showError = false
        return true
    }
    
    
}
