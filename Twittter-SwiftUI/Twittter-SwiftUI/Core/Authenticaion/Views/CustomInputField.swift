//
//  CustomInputField.swift
//  Twittter-SwiftUI
//
//  Created by MAC on 30/10/2023.
//

import SwiftUI

struct CustomInputField: View {
    let imageName: String
    let placeHolder: String
    @Binding var text: String 
    
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(alignment: .center, spacing: 12) {
                Image(systemName: imageName)
                
                TextField("\(placeHolder)", text: $text)
                    .font(.caption)
                    .foregroundColor(.black)
            }
            
            Divider()
            
        }
    }
}


