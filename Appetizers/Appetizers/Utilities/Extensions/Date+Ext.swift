//
//  Date+Ext.swift
//  Appetizers
//
//  Created by Sahana  Rao on 15/01/24.
//

import SwiftUI

extension Date {
    var eighteenYearsAgo : Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    
    var hundredTenYearsAgo : Date {
        Calendar.current.date(byAdding: .year, value: -110, to: Date())!
    }
}

