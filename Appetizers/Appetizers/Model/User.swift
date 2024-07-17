//
//  User.swift
//  Appetizers
//
//  Created by Sahana  Rao on 12/01/24.
//

import Foundation

struct User : Codable {
    var firstName : String = ""
    var lastName : String = ""
    var email : String = ""
    var birthDate : Date = Date()
    var isOn : Bool = false
    var frequentRefills : Bool = false
}
