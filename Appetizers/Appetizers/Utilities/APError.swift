//
//  APError.swift
//  Appetizers
//
//  Created by Sahana  Rao on 09/01/24.
//

import Foundation

enum APError : Error, LocalizedError {
    case invalidUrl
    case invalidResponse
    case invalidData
    case unableToComplete
    case invalidForm
    case invalidEmail
    case userSaveFailure
    case userSaveSuccess
    
    var errorDescription: String? {
        switch self {
        case .invalidUrl :
            return "There was an issue connecting to the server"
            
        case .invalidResponse:
            return "Invalid response from the server. Pls try again later"
            
        case .invalidData:
            return "Data returned from server is invalid."
            
        case .unableToComplete:
            return "Unable to complete your request"
            
        case .invalidForm:
            return "Please ensure all the fields have been filled"
            
        case .invalidEmail:
            return "Please ensure your email is valid"
            
        case .userSaveFailure:
            return "Your profile save failed"
         
        case .userSaveSuccess:
            return "Your profile information was saved successfully"
        }
    }
}
