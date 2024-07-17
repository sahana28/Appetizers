//
//  Appetizers.swift
//  Appetizers
//
//  Created by Sahana  Rao on 08/01/24.
//

import Foundation



struct AppetizersResponse : Decodable{
    let request : [Appetizers]
    
}

struct Appetizers : Decodable, Identifiable{
    let description : String
    let price : Double
    let imageURL : String
    let protein : Int
    let calories : Int
    let id : Int
    let carbs : Int
    let name : String
    
    init(description: String, price: Double, imageURL: String, protein: Int, calories: Int, id: Int, carbs: Int, name: String) {
        self.description = description
        self.price = price
        self.imageURL = imageURL
        self.protein = protein
        self.calories = calories
        self.id = id
        self.carbs = carbs
        self.name = name
    }
}

struct MockData {
    static let sampleAppetizer = Appetizers(description: "This perfectly thin cut just melts in your mouth.",
                                            price: 8.99,
                                            imageURL:"asian flank",
                                            protein: 14,
                                            calories: 300,
                                            id: 1,
                                            carbs: 0,
                                            name: "Asian Flank Steak")
    static let appetizersList = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    static let orderItemOne   =   Appetizers(description: "Iteem One",
                                           price: 8.99,
                                           imageURL:"asian flank",
                                           protein: 14,
                                           calories: 300,
                                           id: 1,
                                           carbs: 0,
                                           name: "Asian Flank Steak")
    
    static let orderItemTwo   =   Appetizers(description: "Item Two",
                                           price: 8.99,
                                           imageURL:"asian flank",
                                           protein: 14,
                                           calories: 300,
                                           id: 2,
                                           carbs: 0,
                                           name: "Asian Flank Steak")
    
    static let orderItemThree   =   Appetizers(description: "Item Three",
                                           price: 8.99,
                                           imageURL:"asian flank",
                                           protein: 14,
                                           calories: 300,
                                           id: 3,
                                           carbs: 0,
                                           name: "Asian Flank Steak")
    
    static let orderList = [orderItemOne, orderItemTwo, orderItemThree]
    
}

