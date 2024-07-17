//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Sahana  Rao on 14/01/24.
//

import SwiftUI

struct StandardButtonStyle : ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandColor)
            .controlSize(.large)
    }
    
}

